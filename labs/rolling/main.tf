terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.39.1"
    }

    random = {
    version = ">=3.6.0"
    }
  }
}

provider "aws" {
}

# Retail Store Code Commit Repository

resource "aws_codecommit_repository" "retail_store_repository" {
  repository_name = "retail-store-sample-codecommit" 
  description     = "Retail Store Sample App Repository"
}

## Required to populate the repo before build - monitor main branch

resource "null_resource" "populate-repo" {
 provisioner "local-exec" {
   command = file("${path.module}/scripts/push-code-commit.sh")
  }
  depends_on = [ aws_codecommit_repository.retail_store_repository ]
 }


### ECR Repository
resource "aws_ecr_repository" "ui_repository" {
  name                 = "retail-store-sample-ui" 
  image_tag_mutability = "MUTABLE"
  force_delete = true
}

resource "aws_ssm_parameter" "retail_store_sample_ui_image" {
  name        = "/codebuild/retail-store-sample-ui-latest-image"
  description = "The Latest Docker image tag for the Retail Store Sample UI"
  type        = "String"
  value       = "latest" 
  lifecycle {
    ignore_changes = [
      value
    ]
  }
}


data "aws_iam_role" "code_build_role" {
  name = "codeBuildWorkshopRole"
}

data "aws_iam_role" "codepipeline_role" {
    name = "codePipelineWorkshopRole"
}

data "aws_iam_role" "code_deploy_role" {
  name = "codeDeployWorkshopRole"
}

data "aws_lb" "retail_store_ecs_ui" {
  name = "retail-store-ecs-ui"
}

data "aws_lb_listener" "bglistener" {
  load_balancer_arn = data.aws_lb.retail_store_ecs_ui.arn
  port              = 8080
}

output "repository_clone_url_http" {
  value = aws_codecommit_repository.retail_store_repository.clone_url_http
}

output "repository_clone_url_ssh" {
  value = aws_codecommit_repository.retail_store_repository.clone_url_ssh
}

## CODE BUILD
resource "aws_codebuild_project" "codebuild_ui" {
  name            = "retail-store-sample-ui-build"
  service_role    = data.aws_iam_role.code_build_role.arn

  artifacts{
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_LARGE"
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    privileged_mode = true
    type            = "LINUX_CONTAINER"

    environment_variable {
      name  = "ECR_URI"
      value = aws_ecr_repository.ui_repository.repository_url
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest-amd64"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yml"
  }
  
  source_version ="refs/heads/main"

depends_on = [ null_resource.populate-repo ]

}

## CODE PIPELINE
resource "random_id" "randomizer" {
  byte_length = 8
}


resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "codepipeline-artifacts-bucket-${random_id.randomizer.hex}"
  force_destroy = true
}

resource "aws_codepipeline" "codepipeline" {
  name     = "ecs-immersion-day-retail-store-sample"
  role_arn = data.aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        RepositoryName = aws_codecommit_repository.retail_store_repository.repository_name
        BranchName     = "main"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "build_ui"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"
      run_order        = 1

      configuration = {
        ProjectName = aws_codebuild_project.codebuild_ui.name
      }
    }

  }
  depends_on = [ aws_codebuild_project.codebuild_ui ]
  // Insert Deploy Stage Here

}

// Add CodeDeploy Definitions Here:
