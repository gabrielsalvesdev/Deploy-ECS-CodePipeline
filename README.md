<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
<head>
  <meta charset="utf-8" />
  <meta name="generator" content="pandoc" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
  <title>Lab AWS pt-BR</title>
  <style>
    html {
      color: #1a1a1a;
      background-color: #fdfdfd;
    }
    body {
      margin: 0 auto;
      max-width: 36em;
      padding-left: 50px;
      padding-right: 50px;
      padding-top: 50px;
      padding-bottom: 50px;
      hyphens: auto;
      overflow-wrap: break-word;
      text-rendering: optimizeLegibility;
      font-kerning: normal;
    }
    @media (max-width: 600px) {
      body {
        font-size: 0.9em;
        padding: 12px;
      }
      h1 {
        font-size: 1.8em;
      }
    }
    @media print {
      html {
        background-color: white;
      }
      body {
        background-color: transparent;
        color: black;
        font-size: 12pt;
      }
      p, h2, h3 {
        orphans: 3;
        widows: 3;
      }
      h2, h3, h4 {
        page-break-after: avoid;
      }
    }
    p {
      margin: 1em 0;
    }
    a {
      color: #1a1a1a;
    }
    a:visited {
      color: #1a1a1a;
    }
    img {
      max-width: 100%;
    }
    svg {
      height: auto;
      max-width: 100%;
    }
    h1, h2, h3, h4, h5, h6 {
      margin-top: 1.4em;
    }
    h5, h6 {
      font-size: 1em;
      font-style: italic;
    }
    h6 {
      font-weight: normal;
    }
    ol, ul {
      padding-left: 1.7em;
      margin-top: 1em;
    }
    li > ol, li > ul {
      margin-top: 0;
    }
    blockquote {
      margin: 1em 0 1em 1.7em;
      padding-left: 1em;
      border-left: 2px solid #e6e6e6;
      color: #606060;
    }
    code {
      font-family: Menlo, Monaco, Consolas, 'Lucida Console', monospace;
      font-size: 85%;
      margin: 0;
      hyphens: manual;
    }
    pre {
      margin: 1em 0;
      overflow: auto;
    }
    pre code {
      padding: 0;
      overflow: visible;
      overflow-wrap: normal;
    }
    .sourceCode {
     background-color: transparent;
     overflow: visible;
    }
    hr {
      background-color: #1a1a1a;
      border: none;
      height: 1px;
      margin: 1em 0;
    }
    table {
      margin: 1em 0;
      border-collapse: collapse;
      width: 100%;
      overflow-x: auto;
      display: block;
      font-variant-numeric: lining-nums tabular-nums;
    }
    table caption {
      margin-bottom: 0.75em;
    }
    tbody {
      margin-top: 0.5em;
      border-top: 1px solid #1a1a1a;
      border-bottom: 1px solid #1a1a1a;
    }
    th {
      border-top: 1px solid #1a1a1a;
      padding: 0.25em 0.5em 0.25em 0.5em;
    }
    td {
      padding: 0.125em 0.5em 0.25em 0.5em;
    }
    header {
      margin-bottom: 4em;
      text-align: center;
    }
    #TOC li {
      list-style: none;
    }
    #TOC ul {
      padding-left: 1.3em;
    }
    #TOC > ul {
      padding-left: 0;
    }
    #TOC a:not(:hover) {
      text-decoration: none;
    }
    code{white-space: pre-wrap;}
    span.smallcaps{font-variant: small-caps;}
    div.columns{display: flex; gap: min(4vw, 1.5em);}
    div.column{flex: auto; overflow-x: auto;}
    div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
    /* The extra [class] is a hack that increases specificity enough to
       override a similar rule in reveal.js */
    ul.task-list[class]{list-style: none;}
    ul.task-list li input[type="checkbox"] {
      font-size: inherit;
      width: 0.8em;
      margin: 0 0.8em 0.2em -1.6em;
      vertical-align: middle;
    }
    .display.math{display: block; text-align: center; margin: 0.5rem auto;}
  </style>
</head>
<body>
<header id="title-block-header">
<h1 class="title"><span id="_Hlk176519052" class="anchor"></span>Lab AWS
pt-BR</h1>
</header>
<p>Amazon ECS e AWS Fargate</p>
<h2 id="sobre-o-amazon-ecs"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/10-about-ecs#about-amazon-ecs">Sobre
o Amazon ECS</a></h2>
<p><img src="media/image2.png"
style="width:0.68344in;height:0.675in" /></p>
<p><a href="https://aws.amazon.com/ecs/"><u>O Amazon ECS</u></a> é um
serviço de orquestração de contêineres totalmente gerenciado que ajuda a
implantar, gerenciar e dimensionar facilmente aplicativos em
contêineres. Ele se integra profundamente ao restante da plataforma AWS
para fornecer uma solução segura e fácil de usar para executar cargas de
trabalho de contêineres na nuvem e agora em sua infraestrutura com o
Amazon ECS Anywhere.</p>
<h2 id="sobre-o-aws-fargate"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/10-about-ecs#about-aws-fargate">Sobre
o AWS Fargate</a></h2>
<p><img src="media/image3.jpeg"
style="width:0.675in;height:0.675in" /></p>
<p><a href="https://aws.amazon.com/fargate/"><u>O AWS Fargate</u></a> é
um mecanismo de computação sem servidor e pago conforme o uso que
permite que você se concentre na criação de aplicativos sem gerenciar
servidores. O AWS Fargate é compatível com o Amazon Elastic Container
Service ECS e o Amazon Elastic Kubernetes Service EKS.</p>
<h2 id="benefícios-do-aws-fargate"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/10-about-ecs#benefits-of-aws-fargate">Benefícios
do AWS Fargate</a></h2>
<blockquote>
<p><img src="media/image4.png" /> <strong>Gerencie seus aplicativos, não
a infraestrutura</strong> Implemente e gerencie seus aplicativos, não a
infraestrutura. Elimine a sobrecarga operacional para dimensionar,
aplicar patches, ajudar a proteger e gerenciar servidores.</p>
<p><img src="media/image4.png" /> <strong>Monitore seus aplicativos para
obter métricas e insights</strong> Monitore seus aplicativos por meio de
integrações internas com serviços da AWS, como o Amazon CloudWatch
Container Insights, ou colete métricas e registros com ferramentas de
terceiros.</p>
<p><img src="media/image4.png" /> <strong>Aumente a segurança por meio
do isolamento</strong>: aumente a segurança por meio do isolamento da
carga de trabalho por design. Com o AWS Fargate, cada carga de trabalho
é executada em sua própria instância de computação de uso único e de
locatário único. Cada carga de trabalho é isolada por um limite de
virtualização, com cada tarefa do Amazon ECS ou pod do Kubernetes em
execução em uma instância recém-provisionada. Consulte o <u>whitepaper
d</u><a
href="https://d1.awsstatic.com/whitepapers/AWS_Fargate_Security_Overview_Whitepaper.pdf"><u>e</u></a>
<a
href="https://d1.awsstatic.com/whitepapers/AWS_Fargate_Security_Overview_Whitepaper.pdf"><u>seguran</u>ç
<u>a do AWS Fargate</u></a> para obter mais detalhes sobre a arquitetura
do AWS Fargate</p>
<p><img src="media/image4.png" /> <strong>Otimize o custo</strong> Pague
somente pelos recursos de computação utilizados, sem despesas iniciais.
Otimize ainda mais os custos com planos de economia, Fargate Spot ou
processadores AWS Graviton.</p>
<p><img src="media/image5.jpeg"
style="width:5.84155in;height:2.37in" /></p>
</blockquote>
<p>Aplicativo de amostra</p>
<p>A maioria dos laboratórios deste workshop usa um aplicativo de
amostra comum para fornecer componentes reais de contêineres com os
quais podemos trabalhar durante os exercícios. O aplicativo de amostra
modela um aplicativo simples de loja on-line, no qual os clientes podem
navegar em um catálogo, adicionar itens ao carrinho e concluir um pedido
por meio do processo de checkout.</p>
<p><img src="media/image6.jpeg"
style="width:5.8695in;height:3.14437in" /></p>
<p>O aplicativo tem vários componentes e dependências:</p>
<blockquote>
<p><img src="media/image7.jpeg"
style="width:4.6631in;height:3.88969in" /></p>
</blockquote>
<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th><strong>Componente</strong></th>
<th><strong>Descrição</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>IU</td>
<td>Fornece a interface de usuário front-end e agrega chamadas de API a
vários outros serviços.</td>
</tr>
<tr>
<td>Catálogo</td>
<td>API para listagens e detalhes de produtos</td>
</tr>
<tr>
<td>Carrinho</td>
<td>API para carrinhos de compras de clientes</td>
</tr>
<tr>
<td>Checkout</td>
<td>API para orquestrar o processo de checkout</td>
</tr>
<tr>
<td>Pedidos</td>
<td>API para receber e processar pedidos de clientes</td>
</tr>
<tr>
<td>Ativos estáticos</td>
<td>Serve ativos estáticos, como imagens relacionadas ao catálogo de
produtos</td>
</tr>
</tbody>
</table>
<p>No decorrer dos laboratórios, utilizaremos diferentes recursos do ECS
para tirar proveito de serviços e recursos mais amplos da AWS para nossa
loja de varejo.</p>
<p>Você pode encontrar o código-fonte completo do aplicativo de amostra
no <a
href="https://github.com/aws-containers/retail-store-sample-app"><u>GitHub</u></a>.</p>
<h2 id="empacotamento-de-cargas-de-trabalho-de-contêineres"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/20-introduction/200-sample-application#packaging-container-workloads">Empacotamento
de cargas de trabalho de contêineres</a></h2>
<p>Antes que uma carga de trabalho possa ser implantada no ECS, ela deve
ser empacotada como uma imagem de contêiner e publicada em um registro
de contêiner. Tópicos básicos sobre contêineres como esse não são
abordados como parte deste workshop, e o aplicativo de amostra tem
imagens de contêineres já disponíveis no Amazon Elastic Container
Registry para os laboratórios que realizaremos hoje.</p>
<p>A tabela abaixo fornece links para o repositório público do ECR para
cada componente, bem como o Dockerfile que foi usado para criar cada
componente.</p>
<table>
<colgroup>
<col style="width: 34%" />
<col style="width: 39%" />
<col style="width: 26%" />
</colgroup>
<thead>
<tr>
<th><strong>Componente</strong></th>
<th><strong>ECR Repositório público</strong></th>
<th><blockquote>
<p><strong>Dockerfile</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>IU</td>
<td><a
href="https://gallery.ecr.aws/aws-containers/retail-store-sample-ui"><u>Repositório</u></a></td>
<td><blockquote>
<p><a
href="https://github.com/aws-containers/retail-store-sample-app/blob/main/src/ui/Dockerfile"><u>Dockerfile</u></a></p>
</blockquote></td>
</tr>
</tbody>
</table>
<table>
<colgroup>
<col style="width: 34%" />
<col style="width: 39%" />
<col style="width: 26%" />
</colgroup>
<thead>
<tr>
<th>Catálogo</th>
<th><a
href="https://gallery.ecr.aws/aws-containers/retail-store-sample-catalog"><u>Repositório</u></a></th>
<th><blockquote>
<p><a
href="https://github.com/aws-containers/retail-store-sample-app/blob/main/src/catalog/Dockerfile"><u>Dockerfile</u></a></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Carrinho de compras</td>
<td><a
href="https://gallery.ecr.aws/aws-containers/retail-store-sample-cart"><u>Repositório</u></a></td>
<td><blockquote>
<p><a
href="https://github.com/aws-containers/retail-store-sample-app/blob/main/src/cart/Dockerfile"><u>Dockerfile</u></a></p>
</blockquote></td>
</tr>
<tr>
<td>Checkout</td>
<td><a
href="https://gallery.ecr.aws/aws-containers/retail-store-sample-checkout"><u>Repositório</u></a></td>
<td><blockquote>
<p><a
href="https://github.com/aws-containers/retail-store-sample-app/blob/main/src/checkout/Dockerfile"><u>Dockerfile</u></a></p>
</blockquote></td>
</tr>
<tr>
<td>Pedidos</td>
<td><a
href="https://gallery.ecr.aws/aws-containers/retail-store-sample-orders"><u>Repositório</u></a></td>
<td><blockquote>
<p><a
href="https://github.com/aws-containers/retail-store-sample-app/blob/main/src/orders/Dockerfile"><u>Dockerfile</u></a></p>
</blockquote></td>
</tr>
<tr>
<td>Ativos</td>
<td><a
href="https://gallery.ecr.aws/aws-containers/retail-store-sample-assets"><u>Repositório</u></a></td>
<td><blockquote>
<p><a
href="https://github.com/aws-containers/retail-store-sample-app/blob/main/src/assets/Dockerfile"><u>Dockerfile</u></a></p>
</blockquote></td>
</tr>
</tbody>
</table>
<p>Estrutura do laboratório</p>
<p>Este workshop foi projetado para ser modular, de modo que você possa
adaptar a experiência aos resultados de aprendizado desejados. Ele é
composto de vários laboratórios discretos e, embora não seja necessário
executar todos os exercícios de laboratório, você deve concluir cada
laboratório individual que escolher.</p>
<p>Os laboratórios individuais são indicados no menu de navegação à
esquerda com o símbolo 📘 da seguinte forma:</p>
<p><img src="media/image8.jpeg"
style="width:2.26125in;height:0.80156in" /></p>
<p>Alguns laboratórios têm pré-requisitos, que serão exibidos no início
de cada laboratório da seguinte forma:</p>
<p><img src="media/image9.png"
style="width:5.01187in;height:0.97875in" /></p>
<blockquote>
<p>📘 Fundamentos</p>
</blockquote>
<h2 id="componentes-principais-do-amazon-ecs"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic#amazon-ecs-core-components">Componentes
principais do Amazon ECS</a></h2>
<p><img src="media/image10.png"
style="width:5.30833in;height:2.76667in" /></p>
<blockquote>
<p><strong>O cluster</strong> é um agrupamento lógico de serviços e
tarefas</p>
<p><strong>O serviço</strong> é um grupo de tarefas idênticas</p>
<p><strong>A tarefa</strong> é um ou mais contêineres que executam uma
função específica do aplicativo <strong>A definição da</strong> tarefa
descreve as necessidades da tarefa CPU, memória, imagens de contêineres,
tipo de rede, IAM etc.)</p>
<p>Cluster do Amazon ECS</p>
<p>Neste laboratório, criaremos os principais componentes do Amazon ECS,
incluindo um cluster do ECS, a definição de tarefas e o serviço do ECS.
O objetivo final é observar um contêiner localizado atrás do ALB
Application Load Balancer).</p>
<p>Crie um cluster do Amazon ECS chamado
<strong>retail-store-ecs-cluster</strong>:</p>
<p>aws ecs create-cluster --cluster-name retail-store-ecs-cluster
--region $AWS_REGION Você deve receber a seguinte saída na linha de
comando.</p>
<p>{</p>
<p>"cluster": {</p>
<p>"clusterArn":
"arn:aws:ecs:us-west-2:111111111111:cluster/retail-store-ecs-cluster",</p>
<p>"clusterName": "retail-store-ecs-cluster",</p>
<p>"status": "ACTIVE",</p>
<p>"registeredContainerInstancesCount": 0,</p>
<p>"runningTasksCount": 0,</p>
<p>"pendingTasksCount": 0,</p>
<p>"activeServicesCount": 0,</p>
<p>"statistics": [],</p>
<p>"tags": [],</p>
<p>"settings": [</p>
<p>{</p>
<p>"name": "containerInsights",</p>
<p>"value": "disabled"</p>
<p>}</p>
<p>],</p>
<p>"capacityProviders": [],</p>
<p>"defaultCapacityProviderStrategy": []</p>
<p>}</p>
<p>}</p>
<p><a
href="https://console.aws.amazon.com/ecs/v2/clusters/retail-store-ecs-cluster"><u>Abra
o console do Amazon ECS</u></a></p>
<p>Agora que o cluster foi criado, navegue até a próxima etapa para
criar uma definição de tarefa do ECS que usaremos para implantar o
serviço de interface do usuário</p>
</blockquote>
<h1 id="definições-de-tarefas">Definições de tarefas</h1>
<blockquote>
<p>A definição de tarefa é um projeto que descreve como um contêiner (ou
contêineres) deve ser executado no Amazon ECS. Ela inclui várias
configurações, como a imagem do contêiner a ser usada, a CPU e a memória
necessárias, as portas a serem abertas e as variáveis de ambiente
necessárias.</p>
<p>Crie a definição de tarefa a ser usada para o <strong>serviço de
interface do usuário</strong>:</p>
</blockquote>
<p>cat &lt;&lt; EOF &gt; retail-store-ecs-ui-taskdef.json</p>
<p>{</p>
<p>"family": "retail-store-ecs-ui",</p>
<p>"networkMode": "awsvpc",</p>
<p>"requiresCompatibilities": [</p>
<p>"FARGATE"</p>
<p>],</p>
<p>"cpu": "1024",</p>
<p>"memory": "2048",</p>
<p>"runtimePlatform": {</p>
<p>"cpuArchitecture": "X86_64",</p>
<p>"operatingSystemFamily": "LINUX"</p>
<p>},</p>
<p>"containerDefinitions": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"image":
"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0",</p>
<p>"portMappings": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"containerPort": 8080,</p>
<p>"hostPort": 8080,</p>
<p>"protocol": "tcp",</p>
<p>"appProtocol": "http"</p>
<p>}</p>
<p>],</p>
<p>"essential": true,</p>
<p>"linuxParameters": {</p>
<p>"initProcessEnabled": true</p>
<p>},</p>
<p>"healthCheck": {</p>
<p>"command": [</p>
<p>"CMD-SHELL",</p>
<p>"curl -f http://localhost:8080/actuator/health || exit 1"</p>
<p>],</p>
<p>"interval": 10,</p>
<p>"timeout": 5,</p>
<p>"retries": 3,</p>
<p>"startPeriod": 60</p>
<p>},</p>
<p>"logConfiguration": {</p>
<p>"logDriver": "awslogs",</p>
<p>"options": {</p>
<p>"awslogs-group": "retail-store-ecs-tasks",</p>
<p>"awslogs-region": "$AWS_REGION",</p>
<p>"awslogs-stream-prefix": "ui-service"</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>],</p>
<p>"executionRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole",</p>
<p>"taskRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskRole"</p>
<p>}</p>
<p>EOF</p>
<p>aws ecs register-task-definition --cli-input-json
file://retail-store-ecs-ui-taskdef.json</p>
<p>Nesta <a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html"><u>página</u></a>,
você pode se aprofundar nos significados detalhados dos parâmetros
dentro da definição de tarefa do ECS. No entanto, vamos abordar
brevemente alguns deles nesta página.</p>
<table>
<colgroup>
<col style="width: 22%" />
<col style="width: 77%" />
</colgroup>
<thead>
<tr>
<th><strong>Parâmetro</strong></th>
<th><strong>Descrição</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>família</td>
<td>Uma família de definição de tarefa é semelhante a um nome para
várias versões da definição de tarefa, especificada com um número de
revisão.</td>
</tr>
<tr>
<td>requiresCompatibilities</td>
<td>O tipo de inicialização especificado para uma definição de tarefa
determina onde o Amazon ECS inicia a tarefa ou o serviço.</td>
</tr>
<tr>
<td>taskRoleArn</td>
<td>Uma função de tarefa para uma função de IAM permite que os
contêineres chamem as APIs do AWS especificadas nas políticas associadas
em seu nome.</td>
</tr>
<tr>
<td>executionRoleArn</td>
<td>Uma função de execução de tarefa que concede ao agente de contêiner
do Amazon ECS permissão para fazer chamadas de API do AWS em seu
nome.</td>
</tr>
<tr>
<td>networkMode</td>
<td>O modo de rede do Docker a ser usado para os contêineres na tarefa.
O modo de rede para o ECS Fargate é restrito ao modo awsvpc.</td>
</tr>
<tr>
<td>CPU, memória</td>
<td>No caso da Fargate, é necessário especificar valores dentro de SKUs
predefinidos.</td>
</tr>
<tr>
<td>containerDefinitions</td>
<td>A definição do contêiner inclui informações detalhadas, como a
imagem do contêiner, mapeamentos de portas e configurações de
verificação de integridade para o contêiner a ser usado em uma tarefa do
ECS.</td>
</tr>
</tbody>
</table>
<p>Podemos recuperar a definição da tarefa usando a CLI do AWS</p>
<p>aws ecs describe-task-definition --task-definition
retail-store-ecs-ui</p>
<p>Serviços</p>
<p>Um serviço ECS permite executar e manter um número especificado de
instâncias de uma definição de tarefa simultaneamente em um cluster do
Amazon ECS. Se alguma dessas tarefas falhar ou parar por qualquer
motivo, o agendador de serviços do ECS inicia outra instância de sua
definição de tarefa para substituí-la, mantendo o número desejado de
tarefas no serviço. Isso proporciona alta disponibilidade ao seu
aplicativo.</p>
<p>Os serviços do ECS são usados para gerenciar aplicativos de longa
duração, microsserviços ou outros componentes de software que exigem
alta disponibilidade. Os serviços no ECS podem ser integrados ao ELB
Elastic Load Balancing) para distribuir o tráfego uniformemente entre as
tarefas no serviço, fornecendo uma maneira perfeita de implementar,
gerenciar e dimensionar seus aplicativos em contêineres.</p>
<p>Para sua conveniência, temos recursos pré-construídos relacionados ao
ALB Application Load Balancer), incluindo o ouvinte, o grupo de destino
e o grupo de segurança com antecedência.</p>
<p>Vamos criar o serviço ECS</p>
<p>export UI_TARGET_GROUP_ARN=$(aws elbv2 describe-target-groups --names
ui-application \</p>
<p>--query 'TargetGroups[0].TargetGroupArn' --output text)</p>
<p>aws ecs create-service \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--service-name ui \</p>
<p>--task-definition retail-store-ecs-ui \</p>
<p>--desired-count 2 \</p>
<p>--launch-type FARGATE \</p>
<p>--load-balancers
targetGroupArn=${UI_TARGET_GROUP_ARN},containerName=application,containerPort=8080
\</p>
<p>--network-configuration
"awsvpcConfiguration={subnets=[${PRIVATE_SUBNET1},${PRIVATE_SUBNET2}],securityGroups=[${UI_SG_ID}],assignPublicIp=DISABLED}</p>
<p>Pode levar vários minutos para que o ECS implemente o serviço e o
registre como estável. Enquanto isso acontece, você pode explorar o
serviço no console do ECS</p>
<p><a
href="https://console.aws.amazon.com/ecs/v2/clusters/retail-store-ecs-cluster/services/ui"><u>Abra
o console do Amazon ECS</u></a></p>
<p>Você também pode aguardar a estabilização do serviço com a CLI do AWS
desta forma:</p>
<p>aws ecs wait services-stable --cluster retail-store-ecs-cluster
--services ui</p>
<p>Quando o serviço estiver estável, você poderá visualizar as tarefas
em execução na CLI</p>
<p>aws ecs describe-tasks \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--tasks $(aws ecs list-tasks --cluster retail-store-ecs-cluster
--query 'taskArns[]' --output text) \</p>
<p>--query "tasks[*].[group, launchType, lastStatus, healthStatus,
taskArn]" --output table</p>
<p>And you can retrieve the load balancer URL like so:</p>
<p>export RETAIL_ALB=$(aws elbv2 describe-load-balancers --name
retail-store-ecs-ui \</p>
<p>--query 'LoadBalancers[0].DNSName' --output text)</p>
<p>echo ${RETAIL_ALB} ; echo</p>
<p>Cole o URL em um navegador da Web para acessar o aplicativo e você
verá essa tela: <img src="media/image11.png"
style="width:4.90259in;height:3.7577in"
alt="Interface gráfica do usuário, Gráfico, Gráfico de mapa de árvore Descrição gerada automaticamente" /></p>
<p>Depois de criar os componentes fundamentais, a arquitetura dos
serviços configurados até o momento é mostrada a seguir.</p>
<p><img src="media/image12.png"
style="width:5.34167in;height:3.35in" /></p>
<p>Atualização de um serviço</p>
<p>Nesta seção, demonstraremos como atualizar um serviço ECS. Isso é
usado em cenários como a alteração da imagem do contêiner ou a
modificação da configuração.</p>
<p>As variáveis de ambiente são um dos principais mecanismos usados para
configurar cargas de trabalho de contêineres, independentemente do
orquestrador. Modificaremos a configuração do serviço de interface do
usuário passando uma nova variável de ambiente que modificará o
comportamento da carga de trabalho. Nesse caso, usaremos a configuração
RETAIL_UI_BANNER, que adicionará um banner à página.</p>
<p>As variáveis de ambiente são expressas nas definições de tarefas do
ECS com um nome e um valor da seguinte forma:</p>
<blockquote>
<p>"environment": [</p>
<p>{</p>
<p>"name": "RETAIL_UI_BANNER",</p>
<p>"value": "We've updated the UI service!"</p>
<p>}</p>
<p>]</p>
<p>Atualize a <strong>definição da tarefa da interface do
usuário</strong> com a variável de ambiente:</p>
<p>cat &lt;&lt; EOF &gt; retail-store-ecs-ui-updated-taskdef.json</p>
<p>{</p>
<p>"family": "retail-store-ecs-ui",</p>
<p>"executionRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole",</p>
<p>"taskRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskRole",</p>
<p>"networkMode": "awsvpc",</p>
<p>"requiresCompatibilities": [</p>
<p>"FARGATE"</p>
<p>],</p>
<p>"cpu": "1024",</p>
<p>"memory": "2048",</p>
<p>"runtimePlatform": {</p>
<p>"cpuArchitecture": "X86_64",</p>
<p>"operatingSystemFamily": "LINUX"</p>
<p>},</p>
<p>"containerDefinitions": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"image":
"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0",</p>
<p>"portMappings": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"containerPort": 8080,</p>
<p>"hostPort": 8080,</p>
<p>"protocol": "tcp",</p>
<p>"appProtocol": "http"</p>
<p>}</p>
<p>],</p>
<p>"essential": true,</p>
<p>"linuxParameters": {</p>
<p>"initProcessEnabled": true</p>
<p>},</p>
<p>"environment": [</p>
<p>{</p>
<p>"name": "RETAIL_UI_BANNER",</p>
<p>"value": "We've updated the UI service!"</p>
<p>}</p>
<p>],</p>
<p>"healthCheck": {</p>
<p>"command": [</p>
<p>"CMD-SHELL",</p>
<p>"curl -f http://localhost:8080/actuator/health || exit 1"</p>
<p>],</p>
<p>"interval": 10,</p>
<p>"timeout": 5,</p>
<p>"retries": 3,</p>
<p>"startPeriod": 60</p>
<p>},</p>
<p>"logConfiguration": {</p>
<p>"logDriver": "awslogs",</p>
<p>"options": {</p>
<p>"awslogs-group": "retail-store-ecs-tasks",</p>
<p>"awslogs-region": "$AWS_REGION",</p>
<p>"awslogs-stream-prefix": "ui-service"</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>EOF</p>
</blockquote>
<p>Agora vamos usar o comando register-task-definition para atualizar a
definição da tarefa. aws ecs register-task-definition --cli-input-json
file://retail-store-ecs-ui-updated-taskdef.json</p>
<p>É importante observar que as definições de tarefas do ECS são
imutáveis, o que significa que, após serem criadas, não podem ser
modificadas. Em vez disso, o comando acima criará uma nova revisão da
definição de tarefa, que é uma cópia da definição de tarefa atual com os
novos valores de parâmetros substituindo os existentes.</p>
<p>Você pode verificar se agora temos várias revisões de definição de
tarefas com o seguinte comando:</p>
<p>aws ecs list-task-definitions --family-prefix retail-store-ecs-ui</p>
<p>O resultado mostrará todas as revisões da família de definição de
tarefas da interface do usuário:</p>
<blockquote>
<p>{</p>
</blockquote>
<p>"taskDefinitionArns": [</p>
<p>"arn:aws:ecs:us-west-2123456789012:task-definition/retail-store-ecs-ui:1",
"arn:aws:ecs:us-west-2123456789012:task-definition/retail-store-ecs-ui:2"</p>
<blockquote>
<p>]</p>
<p>}</p>
</blockquote>
<p>Agora precisamos atualizar o serviço ECS para usar a nova revisão da
definição de tarefa:</p>
<p>aws ecs update-service --cluster retail-store-ecs-cluster --service
ui --task-definition retail- store-ecs-ui</p>
<p>Aguarde até que o ECS implemente as alterações no serviço:</p>
<p>aws ecs wait services-stable --cluster retail-store-ecs-cluster
--services ui</p>
<p>Agora atualize o navegador e você verá que o banner foi adicionado
com base em nossas variáveis de ambiente:</p>
<p><img src="media/image13.png"
style="width:5.9322in;height:0.5in" /></p>
<p>Ativar o ECS Exec</p>
<p>Nesta seção, habilitaremos <strong>o</strong> recurso <strong>ECS
Exec</strong> para executar comandos ou obter um shell para um contêiner
em execução na instância do EC2 ou Fargate. A ativação do ECS Exec é
benéfica para o gerenciamento operacional e também vantajosa do ponto de
vista da segurança. Ele oferece acesso controlado aos contêineres em
execução nas tarefas do ECS, permitindo a solução de problemas segura,
auditada e interativa sem a necessidade de SSH nos hosts.</p>
<p>Ao aproveitar as políticas e funções do IAM, é possível controlar
rigorosamente quem tem acesso para executar comandos dentro dos
contêineres, melhorando assim a postura geral de segurança. Além disso,
todos os comandos executados por meio do ECS Exec são registrados no
CloudWatch, fornecendo uma trilha de auditoria para fins de conformidade
e monitoramento. <a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html"><u>Mais</u></a>
<a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html"><u>informações
podem ser encontradas aqui</u></a> .</p>
<p>As etapas são as seguintes:</p>
<blockquote>
<p><img src="media/image14.png" /> Definir a função IAM para o
usuário</p>
<p><img src="media/image14.png" /> Definir a função de IAM para a função
de tarefa do ECS <img src="media/image14.png" /> Configurar o
ambiente</p>
<p><img src="media/image15.png" /> Habilitar o Amazon ECS Exec no
serviço</p>
<p><img src="media/image14.png" /> Conectar-se à tarefa do ECS</p>
</blockquote>
<h2 id="definir-a-funç-ão-de-iam-para-o-usuário"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#set-the-iam-role-for-the-user">Definir
a funç ão de IAM para o usuário</a></h2>
<p>Como vamos usar o ECS Exec do nosso IDE, precisamos garantir que a
função de IAM anexada ao IDE tenha as políticas de IAM necessárias.
Vamos atualizar a função de IAM associada à instância do EC2 que executa
nosso IDE adicionando a seguinte política em linha:</p>
<p>cat &lt;&lt; EOF &gt; ecs-exec-command-policy.json</p>
<p>{</p>
<p>"Version": "2012-10-17",</p>
<p>"Statement": [</p>
<p>{</p>
<p>"Effect": "Allow",</p>
<p>"Action": [</p>
<p>"ecs:ExecuteCommand",</p>
<p>"ecs:DescribeTasks"</p>
<p>],</p>
<p>"Resource": [</p>
<p>"arn:aws:ecs:${AWS_REGION}:${ACCOUNT_ID}:task/retail-store-ecs-cluster/*",</p>
<p>"arn:aws:ecs:${AWS_REGION}:${ACCOUNT_ID}:cluster/*"</p>
<p>]</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>EOF</p>
<p>aws iam put-role-policy \</p>
<p>--role-name `aws sts get-caller-identity --query 'Arn' | cut -d'/'
-f2` \</p>
<p>--policy-name AmazonECSExecCommand \</p>
<p>--policy-document <a
href="file://ecs-exec-command-policy.json">file://ecs-exec-command-policy.json</a></p>
<p>Expandir para verificar se a política está configurada
corretamente.</p>
<p>Neste laboratório, adicionamos apenas a política de IAM mais básica,
mas podem ser necessárias políticas de IAM adicionais para utilizar
vários recursos do ECS Exec, como os registros do CloudWatch.</p>
<h2 id="section"></h2>
<h2 id="section-1"></h2>
<h2 id="section-2"></h2>
<h2 id="section-3"></h2>
<h2 id="section-4"></h2>
<h2 id="section-5"></h2>
<h2 id="section-6"></h2>
<h2 id="definir-a-funç-ão-de-iam-para-a-funç-ão-de-tarefa-do-ecs"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#set-the-iam-role-for-the-ecs-task-role">Definir
a funç ão de IAM para a funç ão de tarefa do ECS</a></h2>
<p>O ECS Exec precisa de uma função de IAM de tarefa para a comunicação
SSM. Criamos previamente essa função de IAM para a tarefa <strong>UI
Service</strong>. Portanto, vamos apenas verificar suas permissões.</p>
<p>aws iam get-role-policy \</p>
<p>--role-name retailStoreEcsTaskRole \</p>
<p>--policy-name `aws iam list-role-policies --role-name
retailStoreEcsTaskRole --query 'PolicyNames[0]' --output text`</p>
<p>O resultado será o seguinte:</p>
<p>{</p>
<p>"RoleName": "retailStoreEcsTaskRole",</p>
<p>"PolicyName": "RetailStoreEcsTaskRoleDefaultPolicy3AF87919",</p>
<p>"PolicyDocument": {</p>
<p>"Version": "2012-10-17",</p>
<p>"Statement": [</p>
<p>{</p>
<p>"Action": [</p>
<p>"ssmmessages:CreateControlChannel",</p>
<p>"ssmmessages:CreateDataChannel",</p>
<p>"ssmmessages:OpenControlChannel",</p>
<p>"ssmmessages:OpenDataChannel"</p>
<p>],</p>
<p>"Resource": "*",</p>
<p>"Effect": "Allow"</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>}</p>
<h2 id="configurar-o-ambiente"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#setup-the-environment">Configurar
o ambiente</a></h2>
<p>Precisamos da CLI do AWS e do <u>plug-in do Session Manager para a
CLI do AWS</u>. Esses dois utilitários já foram instalados no IDE para
este workshop. Consulte a documentação vinculada acima para fazer isso
em seu próprio ambiente.</p>
<h2 id="habilitar-o-amazon-ecs-exec-na-tarefa"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#enable-amazon-ecs-exec-on-the-task">Habilitar
o Amazon ECS Exec na tarefa</a></h2>
<blockquote>
<p>Atualize o <strong>serviço de interface do usuário</strong> para
ativar o Amazon ECS Exec --enable-execute- command:</p>
</blockquote>
<p>aws ecs update-service \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--service ui \</p>
<p>--task-definition retail-store-ecs-ui \</p>
<p>--enable-execute-command \</p>
<p>--force-new-deployment</p>
<p>Aguarde até que o ECS implemente as alterações no serviço:</p>
<p>aws ecs wait services-stable --cluster retail-store-ecs-cluster
--services ui</p>
<blockquote>
<p>Execute o seguinte comando para selecionar uma das <strong>tarefas da
interface do usuário</strong> em execução com o enableExecuteCommand
ativado:</p>
<p>ECS_EXEC_TASK_ARN=$(aws ecs list-tasks --cluster
retail-store-ecs-cluster \</p>
<p>--service-name ui --query 'taskArns[]' --output text | \</p>
<p>xargs -n1 aws ecs describe-tasks --cluster retail-store-ecs-cluster
--tasks | \</p>
<p>jq -r '.tasks[] | select(.enableExecuteCommand == true) | .taskArn' |
\</p>
<p>head -n 1)</p>
</blockquote>
<p>Verifique o resultado usando o comando echo.</p>
<p>echo $ECS_EXEC_TASK_ARN</p>
<h2 id="conectar-se-à-tarefa-do-ecs"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#connect-to-the-ecs-task">Conectar-se
à tarefa do ECS</a></h2>
<p>Inicie sua sessão interativa /bin/bash na tarefa em execução.</p>
<p>if [ -z ${ECS_EXEC_TASK_ARN} ]; then echo "ECS_EXEC_TASK_ARN is not
correctly configured!"; else</p>
<p>aws ecs execute-command --cluster retail-store-ecs-cluster \</p>
<p>--task $ECS_EXEC_TASK_ARN \</p>
<p>--container application \</p>
<p>--interactive \</p>
<p>--command "/bin/bash"</p>
<p>fi</p>
<p>Você deverá ver um resultado como este:</p>
<blockquote>
<p><strong>The Session Manager plugin was installed successfully. Use
the AWS CLI to start a session.</strong></p>
<p><strong>Starting session with SessionId:
ecs-execute-command-vvdysulqbcz2txr2d262sw2s64</strong></p>
<p><strong>bash-5.2#</strong></p>
<p><strong>Within a new session, you can execute the following
commands:</strong></p>
<p><strong>cat /etc/os-release</strong></p>
<p><strong>df -h</strong></p>
<p><strong>Terminate your session:</strong></p>
<p><strong>exit</strong></p>
<p><strong>Importante</strong></p>
</blockquote>
<p>Você deve ter concluído os seguintes capítulos como pré-requisitos
para este laboratório: <img src="media/image16.png" /> <a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic"><u>Fundamentos</u></a></p>
<p>Como uma única instância do Fargate corresponde a uma única tarefa do
ECS, você precisa</p>
<p>especificar a CPU e a memória da tarefa durante a criação da
definição da tarefa. Portanto, é fundamental dimensionar corretamente as
tarefas do Fargate para garantir que elas possam desempenhar suas
funções com o nível de desempenho desejado. Se uma tarefa tiver
dificuldades devido à insuficiência de CPU ou memória para executar suas
funções, isso indica que a tarefa não está dimensionada corretamente e
pode exigir recursos adicionais. Você pode avaliar com precisão as
necessidades do seu aplicativo fazendo medições de desempenho,
conduzindo testes de carga abrangentes ou observando atentamente as
principais métricas.</p>
<p>Quando estiver confiante de que suas tarefas têm o tamanho adequado,
você poderá dimensionar horizontalmente implantando tarefas adicionais
para lidar com mais solicitações. O escalonamento</p>
<p>horizontal é o método preferido para escalonar cargas de trabalho
nativas da nuvem e em contêineres.</p>
<p>O Amazon ECS oferece a capacidade de ajustar automaticamente o número
desejado de tarefas em seu serviço, um recurso conhecido como
<strong>Service Auto Scaling</strong>. O ECS Service Auto Scaling usa
<strong><a
href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html"><u>o
Application Auto Scalin</u>g</a></strong> para fornecer essa
funcionalidade. E, para ser uma métrica de dimensionamento útil e
eficaz, essa métrica precisa ser <strong>proporcional</strong>. Por
proporcional, entende- se que ela deve ter um comportamento específico.
Por exemplo, se mantivermos o número de tarefas em nosso serviço
estável. E se a carga dobrar, o valor da métrica também deverá
dobrar.</p>
<p>No contexto do ECS, ao utilizar instâncias do EC2, também é
importante considerar o uso de <u>provedores de capacidade</u> para
gerenciar a capacidade das instâncias do EC2, além do ECS Service Auto
Scaling. No entanto, este capítulo se concentra principalmente no
Fargate, portanto, não abordaremos os provedores de capacidade do ECS em
detalhes.</p>
<p>Escala automática de serviço</p>
<p>O Amazon ECS oferece uma integração perfeita com o <strong>Amazon
CloudWatch</strong> para facilitar o dimensionamento eficiente dos
serviços do ECS com base em métricas em tempo real. As métricas do
Amazon ECS são transmitidas ao CloudWatch em intervalos de um minuto,
permitindo um monitoramento preciso e decisões de dimensionamento
oportunas. Quando essas métricas excedem os limites definidos em sua
política de dimensionamento, o CloudWatch aciona um alarme que ajusta o
número desejado de tarefas em seu serviço de acordo. Esse processo de
ajuste dinâmico aumenta a capacidade desejada durante os eventos de
scale-out e a diminui durante os eventos de scale-in, garantindo a
utilização ideal dos recursos.</p>
<p>O Amazon ECS oferece três estratégias sofisticadas de dimensionamento
de serviços:</p>
<blockquote>
<p><strong>Escalonamento de rastreamento de metas</strong> Esse método
visa manter a estabilidade de uma métrica de dimensionamento
especificada, ajustando automaticamente o número de tarefas para atender
a um valor-alvo predefinido. O escalonamento de rastreamento de metas é
preferido por sua simplicidade e baixos requisitos de manutenção, o que
o torna a opção ideal para empresas que buscam eficiência operacional
sem intervenção manual constante.</p>
<p><strong>Dimensionamento por etapas</strong> O escalonamento por
etapas permite maior controle sobre as ações de escalonamento. Os
usuários podem selecionar métricas, definir valores-limite e definir
ajustes de etapas para especificar quantos recursos devem ser
adicionados ou subtraídos. Ele também permite períodos de avaliação de
violação personalizáveis para alarmes de métricas, proporcionando uma
abordagem personalizada para lidar com cargas de trabalho variáveis de
forma eficaz.</p>
<p><strong>Escalonamento programado</strong> O escalonamento programado
é melhor utilizado quando as ações de escalonamento podem ser
antecipadas com base em padrões de demanda conhecidos. Essa estratégia é
perfeita para aplicativos com flutuações previsíveis de tráfego,
permitindo o gerenciamento proativo de recursos para garantir a
estabilidade e o desempenho do serviço durante os horários de pico.</p>
</blockquote>
<p>Esses métodos de dimensionamento permitem que as organizações
aproveitem todo o potencial do ECS, otimizando o custo e o desempenho ao
alinhar a alocação de recursos com a demanda real.</p>
<p>Escala de rastreamento de metas</p>
<p>Nesta seção, configuraremos o dimensionamento automático de serviços
do ECS usando o Target Tracking Scaling. Isso inclui determinar para
quais serviços configurar o dimensionamento</p>
<p>automático de aplicativos e aplicar as políticas de dimensionamento
apropriadas.</p>
<p>Vamos registrar o serviço de interface do usuário como um alvo
dimensionável com o Application Auto Scaling. Esse comando define o
intervalo de dimensionamento do serviço de interface do usuário de um
mínimo de 2 a um máximo de 10 tarefas.</p>
<blockquote>
<p>aws application-autoscaling register-scalable-target \</p>
<p> --service-namespace ecs \</p>
<p>--scalable-dimension ecs:service:DesiredCount \</p>
<p>--resource-id service/retail-store-ecs-cluster/ui \</p>
<p>--min-capacity 2 \</p>
<p>--max-capacity 10</p>
</blockquote>
<p>de escalonamento para nosso destino de escalonamento.</p>
<p>Comece criando um arquivo de configuração JSON para a política de
dimensionamento. Essa configuração utiliza o tipo de métrica predefinida
de <strong>contagem de solicitações por destino</strong> relacionado ao
balanceador de carga de aplicativos que roteia as solicitações para o
serviço ECS. Nesse caso, nosso objetivo é obter 1.500 solicitações por
tarefa (ou destino) do ECS.</p>
<p>Essa política de dimensionamento é apenas um exemplo. Você deve
entender o perfil de dimensionamento de suas cargas de trabalho
específicas para compreender as métricas e os limites de dimensionamento
adequados antes de ativar o dimensionamento automático.</p>
<p>cat &lt;&lt; EOF &gt; ui-scaling-policy.json</p>
<p>{</p>
<p>"TargetValue": 1500,</p>
<p>"PredefinedMetricSpecification": {</p>
<p>"PredefinedMetricType": "ALBRequestCountPerTarget",</p>
<p>"ResourceLabel": "$UI_ALB_PREFIX/$UI_TG_PREFIX"</p>
<p>}</p>
<p>}</p>
<p>EOF</p>
<p>Em seguida, aplique a política de dimensionamento com o seguinte
comando:</p>
<p>aws application-autoscaling put-scaling-policy \</p>
<p>--service-namespace ecs \</p>
<p>--scalable-dimension ecs:service:DesiredCount \</p>
<p>--resource-id service/retail-store-ecs-cluster/ui \</p>
<p>--policy-name ui-scaling-policy --policy-type TargetTrackingScaling
\</p>
<p>--target-tracking-scaling-policy-configuration
file://ui-scaling-policy.json</p>
<h2 id="section-7"></h2>
<h2 id="section-8"></h2>
<h2 id="section-9"></h2>
<h2 id="explorar-o-cloudwatch-alarm"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/40-auto-scaling/200-target-tracking#explore-cloudwatch-alarm">Explorar
o CloudWatch Alarm</a></h2>
<p>Quando você navegar até a guia <strong><a
href="https://console.aws.amazon.com/cloudwatch/home#alarmsV2"><u>Alarmes</u></a></strong>
no serviço CloudWatch, verá que a política de dimensionamento criou 2
alarmes do CloudWatch.</p>
<p><img src="media/image17.jpeg"
style="width:5.85268in;height:1.63875in" /></p>
<blockquote>
<p><img src="media/image18.png" /> O primeiro é um alarme
<strong>alto</strong> que rastreia ALBRequestCountPerTarget &gt; 1500
para 3 pontos de dados em 3 minutos. Quando esse alarme entra em estado
de ALARME, o serviço ECS aumenta a escala adicionando mais tarefas, o
que deve reduzir a média de ALBRequestCountPerTarget na nova contagem de
tarefas. Se o alarme permanecer no estado ALARM no próximo período de
avaliação, mais tarefas serão adicionadas até que o número máximo de
tarefas especificado por sua política de dimensionamento seja
atingido.</p>
<p><img src="media/image19.png" /> O segundo é um alarme
<strong>baixo</strong>, que rastreia ALBRequestCountPerTarget &gt; 1350
para 15 pontos de dados em 15 minutos. Esse alarme é usado para reduzir
o número de tarefas quando o período de alta atividade termina. O
escalonamento é mais lento por design para favorecer uma maior
disponibilidade.</p>
</blockquote>
<h1 id="escala-automática-de-acionamento">Escala automática de
acionamento</h1>
<p>Nesta seção, vamos gerar alguma carga sintética para o nosso serviço
de interface do usuário para ver como ele é dimensionado.</p>
<p>Primeiro, verifique se o nome DNS do balanceador de carga está
associado ao nosso serviço de interface do usuário. Essa variável de
ambiente teria sido exportada como parte do capítulo fundamental.</p>
<blockquote>
<p>export RETAIL_ALB=$(aws elbv2 describe-load-balancers --name
retail-store-ecs-ui \</p>
<p>--query 'LoadBalancers[0].DNSName' --output text)</p>
<p>echo ${RETAIL_ALB}</p>
</blockquote>
<p>Em seguida, executaremos a <a
href="https://httpd.apache.org/docs/2.4/programs/ab.html"><u>ferramenta
hey</u></a> para enviar solicitações ao caminho /home do serviço da
interface do usuário:</p>
<p>hey -n 1000000 -c 5 -q 40 http://$RETAIL_ALB/home</p>
<p>A atividade de escalonamento será acionada quando o <strong>alarme
alto</strong> da métrica de escalonamento for violado por três períodos
consecutivos de um minuto. Se quiser esperar automaticamente até que o
alarme seja acionado, você pode executar este comando:</p>
<p>aws cloudwatch wait alarm-exists --alarm-name-prefix \</p>
<p>TargetTracking-service/retail-store-ecs-cluster/ui-AlarmHigh
--state-value ALARM</p>
<p>Quando o alarme disparar, você notará que a contagem de tarefas do
serviço aumentará de 2 para um número maior:</p>
<p>aws ecs describe-tasks \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--tasks $(aws ecs list-tasks --cluster retail-store-ecs-cluster
--query 'taskArns[]' --output text) \</p>
<p>--query "tasks[*].[group, launchType, lastStatus, healthStatus,
taskArn]" --output table</p>
<p>Você pode observar o alarme alto associado com a política de
dimensionamento em transição para o estado <strong>ALARM</strong> no
console do CloudWatch, como abaixo.</p>
<p><img src="media/image20.jpeg"
style="width:5.9523in;height:2.42344in" /></p>
<p>Você também pode verificar a guia <strong>Events Lab</strong>) na
página UI Service &gt; Serviço da IU &gt; para ver a atividade de
dimensionamento, em que a contagem desejada aumenta além da contagem
inicial de tarefas.</p>
<blockquote>
<p><img src="media/image21.jpeg"
style="width:5.91428in;height:2.99094in" /></p>
</blockquote>
<p>Feche o gerador de carga pressionando Ctrl + C na janela do terminal.
Depois de alguns minutos, o número de tarefas deve voltar a ser 2 como o
número mínimo.</p>
<p>Trabalho em rede</p>
<p>Os aplicativos modernos, como o nosso aplicativo de amostra,
geralmente são criados a partir de vários componentes distribuídos que
se comunicam entre si. Por exemplo, o componente da interface do usuário
se comunica via API com o componente Catalog, que está vinculado a uma
camada persistente no MySQL, como na arquitetura abaixo.</p>
<p><img src="media/image22.png"
style="width:2.03344in;height:3.13031in" /></p>
<p>Neste capítulo, exploraremos os conceitos relevantes da rede do
Amazon ECS relacionados ao Fargate.</p>
<blockquote>
<p><img src="media/image23.png" /> <a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/100-awsvpc-network-mode"><u>Modo
de rede do Amazon ECS</u></a> <img src="media/image24.png" /> <a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect"><u>ECS
Service Connect</u></a></p>
</blockquote>
<p>Modo de rede do Amazon ECS</p>
<p>Ao executar contêineres, é importante considerar as configurações de
rede do contêiner em</p>
<p>execução no host. <u>Consulte a documentação para obter mais
informações sobre como escolhe</u><a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode.html"><u>r</u></a>
<a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode.html"><u>um
modo de rede</u></a>. Nesta seção, forneceremos uma visão geral da
configuração de rede <strong>do modo AWSVPC</strong> necessária para o
Amazon ECS no Fargate.</p>
<p>No <strong>modo AWSVPC,</strong> o Amazon ECS cria e gerencia uma
interface de rede elástica ENI para cada tarefa, e cada tarefa recebe
seu próprio endereço IP privado dentro da VPC. Essa configuração oferece
grande flexibilidade para controlar as comunicações entre tarefas e
serviços em um nível mais granular. O modo de rede AWSVPC é compatível
com as tarefas do Amazon ECS hospedadas no Amazon EC2 e no Fargate. <a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode-awsvpc.html"><u>Para
obter mais informações, clique aqui</u></a>.</p>
<p>Ao usar o Amazon ECS no Fargate, é necessário o modo de rede
AWSVPC.</p>
<p><img src="media/image25.jpeg"
style="width:4.77562in;height:2.7in" /></p>
<blockquote>
<p>Nesta seção, analisaremos a configuração de rede do Amazon ECS.
<strong><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/100-awsvpc-network-mode#review-the-network-mode-on-the-deployed-amazon-ecs-cluster"><u>Revise
o modo de rede no cluster do Amazon ECS implantado</u></a></strong> Abra
o console do Amazon ECS para inspecionar os serviços.</p>
</blockquote>
<p><a
href="https://console.aws.amazon.com/ecs/v2/clusters/retail-store-ecs-cluster/tasks"><u>Abra
o console do Amazon ECS</u></a></p>
<blockquote>
<p><img src="media/image26.jpeg"
style="width:5.94715in;height:3.83167in" /></p>
</blockquote>
<p>A partir daí, você pode selecionar a primeira tarefa em execução.
Role até a seção <strong>Configuração</strong></p>
<blockquote>
<p>para revisar o <strong>modo de rede</strong>, a <strong>ID
ENI</strong> e o <strong>IP privado</strong> anexado à tarefa:</p>
</blockquote>
<p><img src="media/image27.jpeg"
style="width:5.8314in;height:2.19927in" /></p>
<p>Você pode acessar as informações da tarefa de forma programática.
Execute o seguinte comando para obter as informações da tarefa em
execução no serviço de interface do usuário:</p>
<p>aws ecs describe-tasks \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--tasks `aws ecs list-tasks --cluster retail-store-ecs-cluster
--service ui --query 'taskArns[0]' --output text`</p>
<p>{</p>
<p>"tasks": [</p>
<p>{</p>
<p>"attachments": [</p>
<p>{</p>
<p>"id": "464044b3-626f-44da-86ec-fa20a064d408",</p>
<p>"type": "ElasticNetworkInterface",</p>
<p>"status": "ATTACHED",</p>
<p>"details": [</p>
<p>{</p>
<p>"name": "subnetId",</p>
<p>"value": "subnet-08c4050330714ed3d"</p>
<p>},</p>
<p>{</p>
<p>"name": "networkInterfaceId",</p>
<p>"value": "eni-0a6c55131166f85c8"</p>
<p>},</p>
<p>{</p>
<p>"name": "macAddress",</p>
<p>"value": "06:39:15:1c:ae:1f"</p>
<p>},</p>
<p>{</p>
<p>"name": "privateDnsName",</p>
<p>"value": "ip-10-0-4-128.us-west-2.compute.internal"</p>
<p>},</p>
<p>{</p>
<p>"name": "privateIPv4Address",</p>
<p>"value": "10.0.4.128"</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>],</p>
<p>"attributes": [</p>
<p>{</p>
<p>"name": "ecs.cpu-architecture",</p>
<p>"value": "x86_64"</p>
<p>}</p>
<p>],</p>
<p>"availabilityZone": "us-west-2b",</p>
<p>"clusterArn":
"arn:aws:ecs:us-west-2:XXXXXXXXXX:cluster/retail-store-ecs-cluster",</p>
<p>"connectivity": "CONNECTED",</p>
<p>"connectivityAt": "2024-04-10T08:09:33.968000+00:00",</p>
<p>"containers": [</p>
<p>{</p>
<p>"containerArn":
"arn:aws:ecs:us-west-2:XXXXXXXXXX:container/retail-store-ecs-cluster/70137dd0c1d14cf982e5a6b7446c5f54/db0fa651-1727-4215-b5a5-8a5577120942",</p>
<p>"taskArn":
"arn:aws:ecs:us-west-2:XXXXXXXXXX:task/retail-store-ecs-cluster/70137dd0c1d14cf982e5a6b7446c5f54",</p>
<p>"name": "application",</p>
<p>"image":
"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0",</p>
<p>"imageDigest":
"sha256:6316a3c331c39c35798f3b1303f80494526c0a879fe5a3db3b0b9a85c22aab36",</p>
<p>"runtimeId": "70137dd0c1d14cf982e5a6b7446c5f54-524788293",</p>
<p>"lastStatus": "RUNNING",</p>
<p>"networkBindings": [],</p>
<p>"networkInterfaces": [</p>
<p>{</p>
<p>"attachmentId": "464044b3-626f-44da-86ec-fa20a064d408",</p>
<p>"privateIpv4Address": "10.0.4.128"</p>
<p>}</p>
<p>],</p>
<p>"healthStatus": "HEALTHY",</p>
<p>"cpu": "0"</p>
<p>}</p>
<p>],</p>
<p>"cpu": "1024",</p>
<p>"createdAt": "2024-04-10T08:09:29.943000+00:00",</p>
<p>"desiredStatus": "RUNNING",</p>
<p>"enableExecuteCommand": false,</p>
<p>"group": "service:ui",</p>
<p>"healthStatus": "HEALTHY",</p>
<p>"lastStatus": "RUNNING",</p>
<p>"launchType": "FARGATE",</p>
<p>"memory": "2048",</p>
<p>"overrides": {</p>
<p>"containerOverrides": [</p>
<p>{</p>
<p>"name": "application"</p>
<p>}</p>
<p>],</p>
<p>"inferenceAcceleratorOverrides": []</p>
<p>},</p>
<p>"platformVersion": "1.4.0",</p>
<p>"platformFamily": "Linux",</p>
<p>"pullStartedAt": "2024-04-10T08:09:44.535000+00:00",</p>
<p>"pullStoppedAt": "2024-04-10T08:09:52.398000+00:00",</p>
<p>"startedAt": "2024-04-10T08:10:44.148000+00:00",</p>
<p>"startedBy": "ecs-svc/8962710467093341990",</p>
<p>"tags": [],</p>
<p>"taskArn":
"arn:aws:ecs:us-west-2:XXXXXXXXXX:task/retail-store-ecs-cluster/70137dd0c1d14cf982e5a6b7446c5f54",</p>
<p>"taskDefinitionArn":
"arn:aws:ecs:us-west-2:XXXXXXXXXX:task-definition/retail-store-ecs-ui:8",</p>
<p>"version": 4,</p>
<p>"ephemeralStorage": {</p>
<p>"sizeInGiB": 20</p>
<p>}</p>
<p>}</p>
<p>],</p>
<p>"failures": []</p>
<p>}</p>
<p>📘 ECS Service Connect</p>
<blockquote>
<p><strong>O ECS Service Connect</strong> é a maneira recomendada de
lidar com a comunicação serviço a serviço,</p>
</blockquote>
<p>fornecendo recursos de descoberta de serviço, conectividade e
monitoramento de tráfego. Com o Service Connect, seus aplicativos podem
usar nomes curtos e portas padrão para se conectar aos serviços do ECS
no mesmo cluster, em outros clusters, inclusive entre VPCs na mesma
região do AWS. <a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-serviceconnect"><u>Mais
informações podem ser encontradas aqui.</u></a></p>
<p>Outras opções para configurar a comunicação entre serviços no Amazon
ECS Services: <img src="media/image28.png" /> <a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-elb"><u>Balanceador
de carga interno</u></a></p>
<blockquote>
<p><img src="media/image29.png" /> <a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-direct"><u>Descoberta
de servi</u>ç<u>os</u></a></p>
</blockquote>
<p><strong>Habilitando o Service Connect</strong></p>
<p>Nesta seção, habilitaremos a conexão do serviço ECS em nosso cluster
implantando dois outros microsserviços com os quais o serviço de
interface do usuário se comunicará:</p>
<blockquote>
<p><img src="media/image30.png"
style="width:5.91661in;height:3.21187in" /></p>
</blockquote>
<h2 id="implantar-o-serviço-assets"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#deploy-the-assets-service">Implantar
o serviço Assets</a></h2>
<p>Criar definição de tarefa ECS para o <strong>serviço
Assets</strong>.</p>
<p>cat &lt;&lt; EOF &gt; retail-store-ecs-asset-taskdef.json</p>
<p>{</p>
<p>"family": "retail-store-ecs-assets",</p>
<p>"executionRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole",</p>
<p>"networkMode": "awsvpc",</p>
<p>"requiresCompatibilities": [</p>
<p>"FARGATE"</p>
<p>],</p>
<p>"cpu": "1024",</p>
<p>"memory": "2048",</p>
<p>"runtimePlatform": {</p>
<p>"cpuArchitecture": "X86_64",</p>
<p>"operatingSystemFamily": "LINUX"</p>
<p>},</p>
<p>"containerDefinitions": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"image":
"public.ecr.aws/aws-containers/retail-store-sample-assets:0.7.0",</p>
<p>"cpu": 0,</p>
<p>"portMappings": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"containerPort": 8080,</p>
<p>"hostPort": 8080,</p>
<p>"protocol": "tcp",</p>
<p>"appProtocol": "http"</p>
<p>}</p>
<p>],</p>
<p>"essential": true,</p>
<p>"healthCheck": {</p>
<p>"command": [</p>
<p>"CMD-SHELL",</p>
<p>"curl -f http://localhost:8080/health.html || exit 1"</p>
<p>],</p>
<p>"interval": 10,</p>
<p>"timeout": 5,</p>
<p>"retries": 3,</p>
<p>"startPeriod": 60</p>
<p>},</p>
<p>"logConfiguration": {</p>
<p>"logDriver": "awslogs",</p>
<p>"options": {</p>
<p>"awslogs-group": "retail-store-ecs-tasks",</p>
<p>"awslogs-region": "$AWS_REGION",</p>
<p>"awslogs-stream-prefix": "assets-service"</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>EOF</p>
<blockquote>
<p>aws ecs register-task-definition --cli-input-json
file://retail-store-ecs-asset-taskdef.json Crie o serviço Assets ECS
correspondente:</p>
</blockquote>
<p>aws ecs create-service \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--service-name assets \</p>
<p>--task-definition retail-store-ecs-assets \</p>
<p>--desired-count 1 \</p>
<p>--launch-type FARGATE \</p>
<p>--network-configuration
"awsvpcConfiguration={subnets=[${PRIVATE_SUBNET1}, ${PRIVATE_SUBNET2}],
securityGroups=[$ASSET_SG_ID],assignPublicIp=DISABLED}" \</p>
<p>--service-connect-configuration '{</p>
<p>"enabled": true,</p>
<p>"namespace": "retailstore.local",</p>
<p>"services": [</p>
<p>{</p>
<p>"portName": "application",</p>
<p>"discoveryName": "assets",</p>
<p>"clientAliases": [</p>
<p>{</p>
<p>"port": 80,</p>
<p>"dnsName": "assets"</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>]</p>
<p>}'</p>
<p>Observe que, quando criamos esse serviço, especificamos
--service-connect-configuration, que é:</p>
<blockquote>
<p>1- Habilitando o Service Connect</p>
<p>2- Especificação de um namespace que todos os serviços
compartilharão</p>
<p>3- Configurar os serviços do Service Connect que serão fornecidos por
esse serviço ECS, incluindo seu alias e número de porta</p>
</blockquote>
<p><a
href="https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-serviceconnect"><u>Mais
informa</u>ç<u>ões podem ser encontradas aqui.</u></a></p>
<h2 id="implantar-o-serviço-catalog"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#deploy-the-catalog-service">Implantar
o serviço Catalog</a></h2>
<blockquote>
<p>Criar definição de tarefa ECS para o <strong>serviço
Catalog</strong>.</p>
<p>cat &lt;&lt; EOF &gt; retail-store-ecs-catalog-taskdef.json</p>
<p>{</p>
<p>"family": "retail-store-ecs-catalog",</p>
<p>"executionRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/cataologEcsTaskExecutionRole",</p>
<p>"networkMode": "awsvpc",</p>
<p>"requiresCompatibilities": [</p>
<p>"FARGATE"</p>
<p>],</p>
<p>"cpu": "1024",</p>
<p>"memory": "2048",</p>
<p>"runtimePlatform": {</p>
<p>"cpuArchitecture": "X86_64",</p>
<p>"operatingSystemFamily": "LINUX"</p>
<p>},</p>
<p>"containerDefinitions": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"image":
"public.ecr.aws/aws-containers/retail-store-sample-catalog:0.7.0",</p>
<p>"portMappings": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"containerPort": 8080,</p>
<p>"hostPort": 8080,</p>
<p>"protocol": "tcp",</p>
<p>"appProtocol": "http"</p>
<p>}</p>
<p>],</p>
<p>"essential": true,</p>
<p>"environment": [</p>
<p>{</p>
<p>"name": "DB_NAME",</p>
<p>"value": "catalog"</p>
<p>}</p>
<p>],</p>
<p>"secrets": [</p>
<p>{</p>
<p>"name": "DB_ENDPOINT",</p>
<p>"valueFrom":
"arn:aws:ssm:${AWS_REGION}:${ACCOUNT_ID}:parameter/retail-store-ecs/catalog/db-endpoint"</p>
<p>},</p>
<p>{</p>
<p>"name": "DB_PASSWORD",</p>
<p>"valueFrom":
"arn:aws:secretsmanager:${AWS_REGION}:${ACCOUNT_ID}:secret:retail-store-ecs-catalog-db:password::"</p>
<p>},</p>
<p>{</p>
<p>"name": "DB_USER",</p>
<p>"valueFrom":
"arn:aws:secretsmanager:${AWS_REGION}:${ACCOUNT_ID}:secret:retail-store-ecs-catalog-db:username::"</p>
<p>}</p>
<p>],</p>
<p>"healthCheck": {</p>
<p>"command": [</p>
<p>"CMD-SHELL",</p>
<p>"curl -f http://localhost:8080/health || exit 1"</p>
<p>],</p>
<p>"interval": 10,</p>
<p>"timeout": 5,</p>
<p>"retries": 3,</p>
<p>"startPeriod": 60</p>
<p>},</p>
<p>"logConfiguration": {</p>
<p>"logDriver": "awslogs",</p>
<p>"options": {</p>
<p>"awslogs-group": "retail-store-ecs-tasks",</p>
<p>"awslogs-region": "$AWS_REGION",</p>
<p>"awslogs-stream-prefix": "catalog-service"</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>EOF</p>
</blockquote>
<p>aws ecs register-task-definition --cli-input-json
file://retail-store-ecs-catalog-taskdef.json Crie o serviço Catalog ECS
correspondente:</p>
<p>aws ecs create-service \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--service-name catalog \</p>
<p>--task-definition retail-store-ecs-catalog \</p>
<p>--desired-count 1 \</p>
<p>--launch-type FARGATE \</p>
<p>--network-configuration
"awsvpcConfiguration={subnets=[${PRIVATE_SUBNET1}, ${PRIVATE_SUBNET2}],
securityGroups=[$CATALOG_SG_ID],assignPublicIp=DISABLED}" \</p>
<p>--service-connect-configuration '{</p>
<p>"enabled": true,</p>
<p>"namespace": "retailstore.local",</p>
<p>"services": [</p>
<p>{</p>
<p>"portName": "application",</p>
<p>"discoveryName": "catalog",</p>
<p>"clientAliases": [</p>
<p>{</p>
<p>"port": 80,</p>
<p>"dnsName": "catalog"</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>]</p>
<p>}'</p>
<h2 id="atualização-do-serviço-de-interface-do-usuário"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#updating-the-ui-service">Atualização
do serviço de interface do usuário</a></h2>
<p>Antes de atualizarmos o serviço de interface do usuário, vamos
aguardar a conclusão da implantação dos novos serviços:</p>
<p>aws ecs wait services-stable --cluster retail-store-ecs-cluster
--services catalog aws ecs wait services-stable --cluster
retail-store-ecs-cluster --services assets</p>
<p>As seguintes variáveis de ambiente precisam ser adicionadas à
definição da tarefa de interface do usuário para vincular o serviço de
interface do usuário aos serviços de catálogo e de ativos:</p>
<blockquote>
<p>"environment": [</p>
<p>{</p>
<p>"name": "ENDPOINTS_CATALOG",</p>
<p>"value": "http://catalog"</p>
<p>},</p>
<p>{</p>
<p>"name": "ENDPOINTS_ASSETS",</p>
<p>"value": "http://assets"</p>
<p>}</p>
<p>Atualize a <strong>definição da tarefa da interface do
usuário</strong> com as variáveis de ambiente.</p>
</blockquote>
<p>cat &lt;&lt; EOF &gt; retail-store-ecs-ui-connect-taskdef.json</p>
<p>{</p>
<p>"family": "retail-store-ecs-ui",</p>
<p>"executionRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole",</p>
<p>"taskRoleArn":
"arn:aws:iam::${ACCOUNT_ID}:role/retailStoreEcsTaskRole",</p>
<p>"networkMode": "awsvpc",</p>
<p>"requiresCompatibilities": [</p>
<p>"FARGATE"</p>
<p>],</p>
<p>"cpu": "1024",</p>
<p>"memory": "2048",</p>
<p>"runtimePlatform": {</p>
<p>"cpuArchitecture": "X86_64",</p>
<p>"operatingSystemFamily": "LINUX"</p>
<p>},</p>
<p>"containerDefinitions": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"image":
"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0",</p>
<p>"portMappings": [</p>
<p>{</p>
<p>"name": "application",</p>
<p>"containerPort": 8080,</p>
<p>"hostPort": 8080,</p>
<p>"protocol": "tcp",</p>
<p>"appProtocol": "http"</p>
<p>}</p>
<p>],</p>
<p>"essential": true,</p>
<p>"linuxParameters": {</p>
<p>"initProcessEnabled": true</p>
<p>},</p>
<p>"environment": [</p>
<p>{</p>
<p>"name": "ENDPOINTS_CATALOG",</p>
<p>"value": "http://catalog"</p>
<p>},</p>
<p>{</p>
<p>"name": "ENDPOINTS_ASSETS",</p>
<p>"value": "http://assets"</p>
<p>}</p>
<p>],</p>
<p>"healthCheck": {</p>
<p>"command": [</p>
<p>"CMD-SHELL",</p>
<p>"curl -f http://localhost:8080/actuator/health || exit 1"</p>
<p>],</p>
<p>"interval": 10,</p>
<p>"timeout": 5,</p>
<p>"retries": 3,</p>
<p>"startPeriod": 60</p>
<p>},</p>
<p>"logConfiguration": {</p>
<p>"logDriver": "awslogs",</p>
<p>"options": {</p>
<p>"awslogs-group": "retail-store-ecs-tasks",</p>
<p>"awslogs-region": "$AWS_REGION",</p>
<p>"awslogs-stream-prefix": "ui-service"</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>EOF</p>
<p>aws ecs register-task-definition --cli-input-json
file://retail-store-ecs-ui-connect-taskdef.json</p>
<p>Agora, atualize o serviço de interface do usuário com a nova
definição de tarefa:</p>
<p>aws ecs update-service \</p>
<p>--cluster retail-store-ecs-cluster \</p>
<p>--service ui \</p>
<p>--task-definition retail-store-ecs-ui \</p>
<p>--force-new-deployment \</p>
<p>--service-connect-configuration '{</p>
<p>"enabled": true,</p>
<p>"namespace": "retailstore.local",</p>
<p>"services": [</p>
<p>{</p>
<p>"portName": "application",</p>
<p>"discoveryName": "ui",</p>
<p>"clientAliases": [</p>
<p>{</p>
<p>"port": 80,</p>
<p>"dnsName": "ui"</p>
<p>}</p>
<p>]</p>
<p>}</p>
<p>]</p>
<p>}'</p>
<p>echo "Waiting for service to stabilize...</p>
<p>aws ecs wait services-stable --cluster retail-store-ecs-cluster
--services ui</p>
<h2 id="explore-o-aplicativo-da-web"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#explore-web-application">Explore
o aplicativo da Web</a></h2>
<p>Como implantamos não apenas o serviço de interface do usuário, mas
também os serviços Assets e Catalog, a aparência do aplicativo mudou um
pouco.</p>
<p>export RETAIL_ALB=$(aws elbv2 describe-load-balancers --name
retail-store-ecs-ui \</p>
<p>--query 'LoadBalancers[0].DNSName' --output text)</p>
<p>echo ${RETAIL_ALB} ; echo</p>
<p>Cole o URL em um navegador da Web para acessar o aplicativo e você
verá uma tela como a que está abaixo.</p>
<p><img src="media/image31.jpeg"
style="width:5.95679in;height:5.04625in" /></p>
<p>Examinando os serviços</p>
<p>Abra o console do Amazon ECS para inspecionar os serviços. <u>Abra o
console do Amazon ECS</u></p>
<p>Agora você verá três serviços em execução no cluster:</p>
<p><img src="media/image32.png"
style="width:5.8023in;height:2.00594in" /></p>
<p>Navegar até a guia de tarefas mostrará 4 tarefas em execução:</p>
<p><img src="media/image33.jpeg"
style="width:5.93314in;height:2.22917in" /></p>
<p>Selecione uma das tarefas em execução e role para baixo até a seção
Contêineres. Na tela abaixo, você pode ver o aplicativo e os contêineres
de proxy. <a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-concepts.html#service-connect-concepts-proxy"><u>Mais
informações podem ser encontradas</u></a> <a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-concepts.html#service-connect-concepts-proxy"><u>aqui.</u></a></p>
<p><img src="media/image34.png"
style="width:5.92746in;height:1.39719in" /></p>
<h2 id="o-espaço-de-nomes"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/200-examining-the-services#the-namespace">O
espaço de nomes</a></h2>
<p>O Service Connect usa os namespaces <u>do AWS Cloud Map</u> como um
agrupamento lógico de tarefas do Amazon ECS que se comunicam entre si.
Cada serviço do Amazon ECS pode pertencer a apenas um namespace. Os
serviços em um namespace podem ser distribuídos em diferentes clusters
do Amazon ECS na mesma região do AWS e na mesma conta do AWS.</p>
<p>Para revisar os Namespaces do cluster, abra o painel do Amazon ECS e,
na barra de navegação lateral, selecione <strong>Namespace</strong> para
visualizar os namespaces.</p>
<p><img src="media/image35.png"
style="width:5.86829in;height:1.22396in" /></p>
<p>Selecione o namespace para revisar os detalhes da configuração do AWS
Cloud Map associada a cada serviço. O <strong>nome de
descoberta</strong> representa o nome curto associado que pode ser usado
para se conectar ao serviço para serviços que são executados no mesmo
namespace (http://assets).</p>
<blockquote>
<p><img src="media/image36.jpeg"
style="width:5.89326in;height:3.07292in" /></p>
</blockquote>
<p>Métricas</p>
<p>Agora podemos analisar as métricas que o Service Connect
disponibiliza.</p>
<p>O Amazon ECS fornece métricas do CloudWatch que você pode usar para
monitorar seus recursos. <u>Veja a lista completa de métricas
disponíveis aqui</u>.</p>
<p>Execute o seguinte comando para gerar algum tráfego sintético:</p>
<p>export RETAIL_ALB=$(aws elbv2 describe-load-balancers --name
retail-store-ecs-ui \</p>
<p>--query 'LoadBalancers[0].DNSName' --output text)</p>
<p>hey -n 1000000 -c 1 -q 10 <a
href="http://$RETAIL_ALB/home">http://$RETAIL_ALB/home</a></p>
<p><strong>Revise a métrica do ECS Service Connect no painel Traffic
Health</strong></p>
<p>Abra o Amazon ECS Console, selecione o retail-store-ecs-cluster e
abra a guia Service.</p>
<p><img src="media/image32.png"
style="width:5.92071in;height:2.04687in" /></p>
<p>Selecione o serviço de interface do usuário e role para baixo até o
painel <strong>Traffic Health</strong>.</p>
<p>O Amazon ECS envia as seguintes métricas para o CloudWatch a cada
minuto. Quando o Amazon ECS coleta métricas, ele coleta vários pontos de
dados a cada minuto. <u>Mais informa</u>ç<u>ões pode</u><a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/available_cloudwatch_metrics.html"><u>m</u></a>
<a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/available_cloudwatch_metrics.html"><u>ser
encontradas aqui</u></a></p>
<blockquote>
<p><img src="media/image37.jpeg"
style="width:5.89491in;height:3.41062in" /></p>
</blockquote>
<p>O Amazon ECS configura a tarefa e os contêineres de modo que os
aplicativos só se conectem ao proxy se o aplicativo estiver se
conectando aos nomes de endpoint no mesmo namespace. Todo o restante do
tráfego não usa o proxy. O outro tráfego inclui endereços IP no mesmo
VPC, endpoints de serviço do AWS e tráfego externo. <a
href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-concepts.html#service-connect-concepts-proxy"><u>Mais
informa</u>ç<u>ões podem ser encontradas aqui</u></a>. É por isso que
você não encontrará tráfego de saída para os serviços Assets e
Catalog.</p>
<h2
id="revisar-a-métrica-do-ecs-service-connect-no-amazon-cloudwatch"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/300-service-connect-metrics#review-ecs-service-connect-metric-on-amazon-cloudwatch">Revisar
a métrica do ECS Service Connect no Amazon CloudWatch</a></h2>
<p>Abra o console de <a
href="https://console.aws.amazon.com/cloudwatch/home%23metricsV2?graph=~(view~%27timeSeries~stacked~false~stat~%27Average~period~300)&amp;namespace=~%27AWS%2A2fECS"><u>métricas
do Amazon CloudWatch</u></a>:</p>
<p><img src="media/image38.jpeg"
style="width:5.84511in;height:3.25656in" /></p>
<blockquote>
<p>Clique nas métricas <strong>Cluster, DiscoveryName,
ServiceName</strong> e procure por ui para revisar as métricas de
tráfego.</p>
<p><img src="media/image39.jpeg"
style="width:5.93683in;height:3.41792in" /></p>
<p>Você também pode pesquisar <strong>Cluster, ServiceName,
TargetDiscoveryName</strong> para obter outras métricas.</p>
</blockquote>
<p>Serviço de conexão avançada do ECS</p>
<p>Nesta seção, exploraremos os recursos do ECS Service Connect
iniciando uma sessão interativa nos contêineres em execução, para
entender melhor a configuração e os recursos do Service Connect.</p>
<h2 id="conectar-se-à-tarefa-do-ecs-1"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#connect-to-the-ecs-task">Conectar-se
à tarefa do ECS</a></h2>
<p>Execute o seguinte comando para selecionar uma das tarefas em
execução com o enableExecuteCommand ativado:</p>
<blockquote>
<p>ECS_EXEC_TASK_ARN=$(aws ecs list-tasks --cluster
retail-store-ecs-cluster \</p>
<p>--service-name ui --query 'taskArns[]' --output text | \</p>
<p>xargs -n1 aws ecs describe-tasks --cluster retail-store-ecs-cluster
--tasks | \</p>
<p>jq -r '.tasks[] | select(.enableExecuteCommand == true) | .taskArn' |
\</p>
<p>head -n 1)</p>
<p>echo $ECS_EXEC_TASK_ARN</p>
</blockquote>
<p>Isso produzirá o ARN da tarefa:</p>
<p>arn:aws:ecs:us-west-2:XXXXXXXXXX:task/retail-store-ecs-cluster/0564778486a846599b8bd6b544e5f6eb</p>
<p>Inicie sua sessão interativa /bin/bash na tarefa em execução:</p>
<p>if [ -z ${ECS_EXEC_TASK_ARN} ]; then echo "ECS_EXEC_TASK_ARN is not
correctly configured!"; else</p>
<p>aws ecs execute-command --cluster retail-store-ecs-cluster \</p>
<p>--task $ECS_EXEC_TASK_ARN \</p>
<p>--container application \</p>
<p>--interactive \</p>
<p>--command "/bin/bash”</p>
<p>fi</p>
<h2 id="section-10"></h2>
<h2 id="ambiente-de-configuração"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#setup-environment">Ambiente
de configuração</a></h2>
<p>No shell do Bash, instale o comando jq no contêiner em execução para
formatar a saída json na linha de comando.</p>
<p>yum install jq -y</p>
<h2 id="explore-o-arquivo-do-host"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#explore-the-host-file">Explore
o arquivo do host</a></h2>
<p>O arquivo /etc/hosts fornece a correspondência do nome de domínio
totalmente qualificado</p>
<p>(FQDN) com os respectivos IPs. Revise o conteúdo do arquivo
/etc/hosts executando o seguinte comando.</p>
<p>cat /etc/hosts</p>
<p>127.0.0.1 localhost</p>
<p>X.X.X.X ip-X-X-X-X.us-west-2.compute.internal</p>
<p>127.255.0.1 assets</p>
<p>2600:f0f0:0:0:0:0:0:1 assets</p>
<p>127.255.0.2 catalog</p>
<p>2600:f0f0:0:0:0:0:0:2 catalog</p>
<p>127.255.0.3 ui</p>
<p>2600:f0f0:0:0:0:0:0:3 ui</p>
<p>O arquivo contém a configuração de 3 <strong>nomes de
descoberta</strong> no espaço de nomes do ECS com 3 IPs locais
diferentes 127.255.0.X (IPv4 e IPv6). Todos os IPs locais estão
apontando para o mesmo proxy local do ECS que redirecionará o tráfego
para o proxy remoto do ECS correto vinculado ao serviço específico.</p>
<h2 id="teste-a-conexão-com-o-serviço-catalog"><a
href="https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#test-the-connection-to-the-catalog-service">Teste
a conexão com o serviço Catalog</a></h2>
<p>Teste a conexão com a API do Catalog a partir do contêiner em
execução. curl http://catalog/catalogue/tags | jq</p>
<blockquote>
<p>[</p>
<p>{</p>
</blockquote>
<p>"name": "smart", "displayName": "Smart"</p>
<blockquote>
<p>},</p>
<p>{</p>
</blockquote>
<p>"name": "dress",</p>
<p>"displayName": "Dress" (vestido)</p>
<blockquote>
<p>},</p>
<p>{</p>
</blockquote>
<p>"name": "luxury", "displayName": "Luxury" (luxo)</p>
<blockquote>
<p>},</p>
<p>{</p>
</blockquote>
<p>"name": "casual", "displayName": "Casual"</p>
<blockquote>
<p>}</p>
<p>]</p>
</blockquote>
<p>Encerre sua sessão executiva:</p>
<p>exit</p>
</body>
</html>
