#!/bin/bash
set -x

git clone https://github.com/aws-containers/retail-store-sample-app.git /home/ec2-user/environment/retail-store-sample-app

git clone codecommit://retail-store-sample-codecommit /home/ec2-user/environment/retail-store-sample-codecommit

git -C /home/ec2-user/environment/retail-store-sample-codecommit checkout -b main
cp -R /home/ec2-user/environment/retail-store-sample-app/src /home/ec2-user/environment/retail-store-sample-codecommit
cp -R /home/ec2-user/environment/retail-store-sample-app/images /home/ec2-user/environment/retail-store-sample-codecommit

cat << 'EOF' > /home/ec2-user/environment/retail-store-sample-codecommit/buildspec.yml
version: 0.2

phases:
  install:
    commands:
      - echo Build started on `date`
  pre_build:
    commands:
      - ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
      - echo Logging in to Amazon ECR in $AWS_REGION
      - COMMIT_HASH=$(echo $CODEBUILD_RESOLVED_SOURCE_VERSION | cut -c 1-8)
      - IMAGE_TAG_I=i$(date +%Y%m%d%H%M%S)-${COMMIT_HASH:=latest}
      - echo ECR_URI=$ECR_URI
      - echo IMAGE_TAG=$IMAGE_TAG
      - echo IMAGE_TAG_I=$IMAGE_TAG_I
      - aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URI
  build:
    commands:
      - echo Building a container image ...
      - component=ui
      - component_dir="./src/$component"
      - cd $component_dir
      - docker build -t $ECR_URI:$IMAGE_TAG .
      - docker tag $ECR_URI:$IMAGE_TAG $ECR_URI:$IMAGE_TAG_I
      - docker images
  post_build:
    commands:
      - docker push $ECR_URI:$IMAGE_TAG_I
      - docker push $ECR_URI:$IMAGE_TAG
      - aws ssm put-parameter --name "/codebuild/retail-store-sample-ui-latest-image" --value "$IMAGE_TAG_I" --type "String" --overwrite
      - echo Build completed on `date`
EOF

git -C /home/ec2-user/environment/retail-store-sample-codecommit add .
git -C /home/ec2-user/environment/retail-store-sample-codecommit commit -am "initial commit"
git -C /home/ec2-user/environment/retail-store-sample-codecommit push --set-upstream origin main
