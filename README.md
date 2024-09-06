---
generator: pandoc
title: Lab AWS pt-BR
viewport: width=device-width, initial-scale=1.0, user-scalable=yes
---

::: {#title-block-header}
# []{#_Hlk176519052 .anchor}Lab AWS pt-BR {#lab-aws-pt-br .title}
:::

Amazon ECS e AWS Fargate

## [Sobre o Amazon ECS](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/10-about-ecs#about-amazon-ecs)

![](media/image2.png){style="width:0.68344in;height:0.675in"}

[[O Amazon ECS]{.underline}](https://aws.amazon.com/ecs/) é um serviço
de orquestração de contêineres totalmente gerenciado que ajuda a
implantar, gerenciar e dimensionar facilmente aplicativos em
contêineres. Ele se integra profundamente ao restante da plataforma AWS
para fornecer uma solução segura e fácil de usar para executar cargas de
trabalho de contêineres na nuvem e agora em sua infraestrutura com o
Amazon ECS Anywhere.

## [Sobre o AWS Fargate](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/10-about-ecs#about-aws-fargate)

![](media/image3.jpeg){style="width:0.675in;height:0.675in"}

[[O AWS Fargate]{.underline}](https://aws.amazon.com/fargate/) é um
mecanismo de computação sem servidor e pago conforme o uso que permite
que você se concentre na criação de aplicativos sem gerenciar
servidores. O AWS Fargate é compatível com o Amazon Elastic Container
Service ECS e o Amazon Elastic Kubernetes Service EKS.

## [Benefícios do AWS Fargate](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/10-about-ecs#benefits-of-aws-fargate)

> ![](media/image4.png) **Gerencie seus aplicativos, não a
> infraestrutura** Implemente e gerencie seus aplicativos, não a
> infraestrutura. Elimine a sobrecarga operacional para dimensionar,
> aplicar patches, ajudar a proteger e gerenciar servidores.
>
> ![](media/image4.png) **Monitore seus aplicativos para obter métricas
> e insights** Monitore seus aplicativos por meio de integrações
> internas com serviços da AWS, como o Amazon CloudWatch Container
> Insights, ou colete métricas e registros com ferramentas de terceiros.
>
> ![](media/image4.png) **Aumente a segurança por meio do isolamento**:
> aumente a segurança por meio do isolamento da carga de trabalho por
> design. Com o AWS Fargate, cada carga de trabalho é executada em sua
> própria instância de computação de uso único e de locatário único.
> Cada carga de trabalho é isolada por um limite de virtualização, com
> cada tarefa do Amazon ECS ou pod do Kubernetes em execução em uma
> instância recém-provisionada. Consulte o [whitepaper
> d]{.underline}[[e]{.underline}](https://d1.awsstatic.com/whitepapers/AWS_Fargate_Security_Overview_Whitepaper.pdf)
> [[seguran]{.underline}ç [a do AWS
> Fargate]{.underline}](https://d1.awsstatic.com/whitepapers/AWS_Fargate_Security_Overview_Whitepaper.pdf)
> para obter mais detalhes sobre a arquitetura do AWS Fargate
>
> ![](media/image4.png) **Otimize o custo** Pague somente pelos recursos
> de computação utilizados, sem despesas iniciais. Otimize ainda mais os
> custos com planos de economia, Fargate Spot ou processadores AWS
> Graviton.
>
> ![](media/image5.jpeg){style="width:5.84155in;height:2.37in"}

Aplicativo de amostra

A maioria dos laboratórios deste workshop usa um aplicativo de amostra
comum para fornecer componentes reais de contêineres com os quais
podemos trabalhar durante os exercícios. O aplicativo de amostra modela
um aplicativo simples de loja on-line, no qual os clientes podem navegar
em um catálogo, adicionar itens ao carrinho e concluir um pedido por
meio do processo de checkout.

![](media/image6.jpeg){style="width:5.8695in;height:3.14437in"}

O aplicativo tem vários componentes e dependências:

> ![](media/image7.jpeg){style="width:4.6631in;height:3.88969in"}

  ---------------------------------------------------------------------------
  **Componente**   **Descrição**
  ---------------- ----------------------------------------------------------
  IU               Fornece a interface de usuário front-end e agrega chamadas
                   de API a vários outros serviços.

  Catálogo         API para listagens e detalhes de produtos

  Carrinho         API para carrinhos de compras de clientes

  Checkout         API para orquestrar o processo de checkout

  Pedidos          API para receber e processar pedidos de clientes

  Ativos estáticos Serve ativos estáticos, como imagens relacionadas ao
                   catálogo de produtos
  ---------------------------------------------------------------------------

No decorrer dos laboratórios, utilizaremos diferentes recursos do ECS
para tirar proveito de serviços e recursos mais amplos da AWS para nossa
loja de varejo.

Você pode encontrar o código-fonte completo do aplicativo de amostra no
[[GitHub]{.underline}](https://github.com/aws-containers/retail-store-sample-app).

## [Empacotamento de cargas de trabalho de contêineres](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/20-introduction/200-sample-application#packaging-container-workloads)

Antes que uma carga de trabalho possa ser implantada no ECS, ela deve
ser empacotada como uma imagem de contêiner e publicada em um registro
de contêiner. Tópicos básicos sobre contêineres como esse não são
abordados como parte deste workshop, e o aplicativo de amostra tem
imagens de contêineres já disponíveis no Amazon Elastic Container
Registry para os laboratórios que realizaremos hoje.

A tabela abaixo fornece links para o repositório público do ECR para
cada componente, bem como o Dockerfile que foi usado para criar cada
componente.

+-----------------------+---------------------------+-----------------+
| **Componente**        | **ECR Repositório         | >               |
|                       | público**                 |  **Dockerfile** |
+=======================+===========================+=================+
| IU                    | [[Repositório]{           | > [[Docker      |
|                       | .underline}](https://gall | file]{.underlin |
|                       | ery.ecr.aws/aws-container | e}](https://git |
|                       | s/retail-store-sample-ui) | hub.com/aws-con |
|                       |                           | tainers/retail- |
|                       |                           | store-sample-ap |
|                       |                           | p/blob/main/src |
|                       |                           | /ui/Dockerfile) |
+-----------------------+---------------------------+-----------------+

+-----------------------+---------------------------+-----------------+
| Catálogo              | [[Repositório]{.unde      | > [[Dockerfile] |
|                       | rline}](https://gallery.e | {.underline}](h |
|                       | cr.aws/aws-containers/ret | ttps://github.c |
|                       | ail-store-sample-catalog) | om/aws-containe |
|                       |                           | rs/retail-store |
|                       |                           | -sample-app/blo |
|                       |                           | b/main/src/cata |
|                       |                           | log/Dockerfile) |
+=======================+===========================+=================+
| Carrinho de compras   | [[Repositório]{.u         | > [[Dockerfi    |
|                       | nderline}](https://galler | le]{.underline} |
|                       | y.ecr.aws/aws-containers/ | ](https://githu |
|                       | retail-store-sample-cart) | b.com/aws-conta |
|                       |                           | iners/retail-st |
|                       |                           | ore-sample-app/ |
|                       |                           | blob/main/src/c |
|                       |                           | art/Dockerfile) |
+-----------------------+---------------------------+-----------------+
| Checkout              | [[Repositório]{.under     | >               |
|                       | line}](https://gallery.ec |  [[Dockerfile]{ |
|                       | r.aws/aws-containers/reta | .underline}](ht |
|                       | il-store-sample-checkout) | tps://github.co |
|                       |                           | m/aws-container |
|                       |                           | s/retail-store- |
|                       |                           | sample-app/blob |
|                       |                           | /main/src/check |
|                       |                           | out/Dockerfile) |
+-----------------------+---------------------------+-----------------+
| Pedidos               | [[Repositório]{.und       | > [[Dockerfile  |
|                       | erline}](https://gallery. | ]{.underline}]( |
|                       | ecr.aws/aws-containers/re | https://github. |
|                       | tail-store-sample-orders) | com/aws-contain |
|                       |                           | ers/retail-stor |
|                       |                           | e-sample-app/bl |
|                       |                           | ob/main/src/ord |
|                       |                           | ers/Dockerfile) |
+-----------------------+---------------------------+-----------------+
| Ativos                | [[Repositório]{.und       | > [[Dockerfile  |
|                       | erline}](https://gallery. | ]{.underline}]( |
|                       | ecr.aws/aws-containers/re | https://github. |
|                       | tail-store-sample-assets) | com/aws-contain |
|                       |                           | ers/retail-stor |
|                       |                           | e-sample-app/bl |
|                       |                           | ob/main/src/ass |
|                       |                           | ets/Dockerfile) |
+-----------------------+---------------------------+-----------------+

Estrutura do laboratório

Este workshop foi projetado para ser modular, de modo que você possa
adaptar a experiência aos resultados de aprendizado desejados. Ele é
composto de vários laboratórios discretos e, embora não seja necessário
executar todos os exercícios de laboratório, você deve concluir cada
laboratório individual que escolher.

Os laboratórios individuais são indicados no menu de navegação à
esquerda com o símbolo 📘 da seguinte forma:

![](media/image8.jpeg){style="width:2.26125in;height:0.80156in"}

Alguns laboratórios têm pré-requisitos, que serão exibidos no início de
cada laboratório da seguinte forma:

![](media/image9.png){style="width:5.01187in;height:0.97875in"}

> 📘 Fundamentos

## [Componentes principais do Amazon ECS](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic#amazon-ecs-core-components)

![](media/image10.png){style="width:5.30833in;height:2.76667in"}

> **O cluster** é um agrupamento lógico de serviços e tarefas
>
> **O serviço** é um grupo de tarefas idênticas
>
> **A tarefa** é um ou mais contêineres que executam uma função
> específica do aplicativo **A definição da** tarefa descreve as
> necessidades da tarefa CPU, memória, imagens de contêineres, tipo de
> rede, IAM etc.)
>
> Cluster do Amazon ECS
>
> Neste laboratório, criaremos os principais componentes do Amazon ECS,
> incluindo um cluster do ECS, a definição de tarefas e o serviço do
> ECS. O objetivo final é observar um contêiner localizado atrás do ALB
> Application Load Balancer).
>
> Crie um cluster do Amazon ECS chamado **retail-store-ecs-cluster**:
>
> aws ecs create-cluster \--cluster-name retail-store-ecs-cluster
> \--region \$AWS_REGION Você deve receber a seguinte saída na linha de
> comando.
>

> {
>
> \"cluster\": {
>
> \"clusterArn\":
> \"arn:aws:ecs:us-west-2:111111111111:cluster/retail-store-ecs-cluster\",
>
> \"clusterName\": \"retail-store-ecs-cluster\",
>
> \"status\": \"ACTIVE\",
>
> \"registeredContainerInstancesCount\": 0,
>
> \"runningTasksCount\": 0,
>
> \"pendingTasksCount\": 0,
>
> \"activeServicesCount\": 0,
>
> \"statistics\": \[\],
>
> \"tags\": \[\],
>
> \"settings\": \[
>
> {
>
> \"name\": \"containerInsights\",
>
> \"value\": \"disabled\"
>
> }
>
> \],
>
> \"capacityProviders\": \[\],
>
> \"defaultCapacityProviderStrategy\": \[\]
>
> }
>
> }
>
> [[Abra o console do Amazon
> ECS]{.underline}](https://console.aws.amazon.com/ecs/v2/clusters/retail-store-ecs-cluster)
>
> Agora que o cluster foi criado, navegue até a próxima etapa para criar
> uma definição de tarefa do ECS que usaremos para implantar o serviço
> de interface do usuário

# Definições de tarefas

> A definição de tarefa é um projeto que descreve como um contêiner (ou
> contêineres) deve ser executado no Amazon ECS. Ela inclui várias
> configurações, como a imagem do contêiner a ser usada, a CPU e a
> memória necessárias, as portas a serem abertas e as variáveis de
> ambiente necessárias.
>
> Crie a definição de tarefa a ser usada para o **serviço de interface
> do usuário**:

cat \<\< EOF \> retail-store-ecs-ui-taskdef.json

{

\"family\": \"retail-store-ecs-ui\",

\"networkMode\": \"awsvpc\",

\"requiresCompatibilities\": \[

\"FARGATE\"

\],

\"cpu\": \"1024\",

\"memory\": \"2048\",

\"runtimePlatform\": {

\"cpuArchitecture\": \"X86_64\",

\"operatingSystemFamily\": \"LINUX\"

},

\"containerDefinitions\": \[

{

\"name\": \"application\",

\"image\":
\"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0\",

\"portMappings\": \[

{

\"name\": \"application\",

\"containerPort\": 8080,

\"hostPort\": 8080,

\"protocol\": \"tcp\",

\"appProtocol\": \"http\"

}

\],

\"essential\": true,

\"linuxParameters\": {

\"initProcessEnabled\": true

},

\"healthCheck\": {

\"command\": \[

\"CMD-SHELL\",

\"curl -f http://localhost:8080/actuator/health \|\| exit 1\"

\],

\"interval\": 10,

\"timeout\": 5,

\"retries\": 3,

\"startPeriod\": 60

},

\"logConfiguration\": {

\"logDriver\": \"awslogs\",

\"options\": {

\"awslogs-group\": \"retail-store-ecs-tasks\",

\"awslogs-region\": \"\$AWS_REGION\",

\"awslogs-stream-prefix\": \"ui-service\"

}

}

}

\],

\"executionRoleArn\":
\"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole\",

\"taskRoleArn\":
\"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskRole\"

}

EOF

aws ecs register-task-definition \--cli-input-json
file://retail-store-ecs-ui-taskdef.json

Nesta
[[página]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html),
você pode se aprofundar nos significados detalhados dos parâmetros
dentro da definição de tarefa do ECS. No entanto, vamos abordar
brevemente alguns deles nesta página.

  --------------------------------------------------------------------------------
  **Parâmetro**             **Descrição**
  ------------------------- ------------------------------------------------------
  família                   Uma família de definição de tarefa é semelhante a um
                            nome para várias versões da definição de tarefa,
                            especificada com um número de revisão.

  requiresCompatibilities   O tipo de inicialização especificado para uma
                            definição de tarefa determina onde o Amazon ECS inicia
                            a tarefa ou o serviço.

  taskRoleArn               Uma função de tarefa para uma função de IAM permite
                            que os contêineres chamem as APIs do AWS especificadas
                            nas políticas associadas em seu nome.

  executionRoleArn          Uma função de execução de tarefa que concede ao agente
                            de contêiner do Amazon ECS permissão para fazer
                            chamadas de API do AWS em seu nome.

  networkMode               O modo de rede do Docker a ser usado para os
                            contêineres na tarefa. O modo de rede para o ECS
                            Fargate é restrito ao modo awsvpc.

  CPU, memória              No caso da Fargate, é necessário especificar valores
                            dentro de SKUs predefinidos.

  containerDefinitions      A definição do contêiner inclui informações
                            detalhadas, como a imagem do contêiner, mapeamentos de
                            portas e configurações de verificação de integridade
                            para o contêiner a ser usado em uma tarefa do ECS.
  --------------------------------------------------------------------------------

Podemos recuperar a definição da tarefa usando a CLI do AWS

aws ecs describe-task-definition \--task-definition retail-store-ecs-ui

Serviços

Um serviço ECS permite executar e manter um número especificado de
instâncias de uma definição de tarefa simultaneamente em um cluster do
Amazon ECS. Se alguma dessas tarefas falhar ou parar por qualquer
motivo, o agendador de serviços do ECS inicia outra instância de sua
definição de tarefa para substituí-la, mantendo o número desejado de
tarefas no serviço. Isso proporciona alta disponibilidade ao seu
aplicativo.

Os serviços do ECS são usados para gerenciar aplicativos de longa
duração, microsserviços ou outros componentes de software que exigem
alta disponibilidade. Os serviços no ECS podem ser integrados ao ELB
Elastic Load Balancing) para distribuir o tráfego uniformemente entre as
tarefas no serviço, fornecendo uma maneira perfeita de implementar,
gerenciar e dimensionar seus aplicativos em contêineres.

Para sua conveniência, temos recursos pré-construídos relacionados ao
ALB Application Load Balancer), incluindo o ouvinte, o grupo de destino
e o grupo de segurança com antecedência.

Vamos criar o serviço ECS

export UI_TARGET_GROUP_ARN=\$(aws elbv2 describe-target-groups \--names
ui-application \\

\--query \'TargetGroups\[0\].TargetGroupArn\' \--output text)

aws ecs create-service \\

\--cluster retail-store-ecs-cluster \\

\--service-name ui \\

\--task-definition retail-store-ecs-ui \\

\--desired-count 2 \\

\--launch-type FARGATE \\

\--load-balancers
targetGroupArn=\${UI_TARGET_GROUP_ARN},containerName=application,containerPort=8080
\\

\--network-configuration
\"awsvpcConfiguration={subnets=\[\${PRIVATE_SUBNET1},\${PRIVATE_SUBNET2}\],securityGroups=\[\${UI_SG_ID}\],assignPublicIp=DISABLED}

Pode levar vários minutos para que o ECS implemente o serviço e o
registre como estável. Enquanto isso acontece, você pode explorar o
serviço no console do ECS

[[Abra o console do Amazon
ECS]{.underline}](https://console.aws.amazon.com/ecs/v2/clusters/retail-store-ecs-cluster/services/ui)

Você também pode aguardar a estabilização do serviço com a CLI do AWS
desta forma:

aws ecs wait services-stable \--cluster retail-store-ecs-cluster
\--services ui

Quando o serviço estiver estável, você poderá visualizar as tarefas em
execução na CLI

aws ecs describe-tasks \\

\--cluster retail-store-ecs-cluster \\

\--tasks \$(aws ecs list-tasks \--cluster retail-store-ecs-cluster
\--query \'taskArns\[\]\' \--output text) \\

\--query \"tasks\[\*\].\[group, launchType, lastStatus, healthStatus,
taskArn\]\" \--output table

And you can retrieve the load balancer URL like so:

export RETAIL_ALB=\$(aws elbv2 describe-load-balancers \--name
retail-store-ecs-ui \\

\--query \'LoadBalancers\[0\].DNSName\' \--output text)

echo \${RETAIL_ALB} ; echo

Cole o URL em um navegador da Web para acessar o aplicativo e você verá
essa tela: ![Interface gráfica do usuário, Gráfico, Gráfico de mapa de
árvore Descrição gerada
automaticamente](media/image11.png){style="width:4.90259in;height:3.7577in"}

Depois de criar os componentes fundamentais, a arquitetura dos serviços
configurados até o momento é mostrada a seguir.

![](media/image12.png){style="width:5.34167in;height:3.35in"}

Atualização de um serviço

Nesta seção, demonstraremos como atualizar um serviço ECS. Isso é usado
em cenários como a alteração da imagem do contêiner ou a modificação da
configuração.

As variáveis de ambiente são um dos principais mecanismos usados para
configurar cargas de trabalho de contêineres, independentemente do
orquestrador. Modificaremos a configuração do serviço de interface do
usuário passando uma nova variável de ambiente que modificará o
comportamento da carga de trabalho. Nesse caso, usaremos a configuração
RETAIL_UI_BANNER, que adicionará um banner à página.

As variáveis de ambiente são expressas nas definições de tarefas do ECS
com um nome e um valor da seguinte forma:

> \"environment\": \[
>
> {
>
> \"name\": \"RETAIL_UI_BANNER\",
>
> \"value\": \"We\'ve updated the UI service!\"
>
> }
>
> \]
>
> Atualize a **definição da tarefa da interface do usuário** com a
> variável de ambiente:
>
> cat \<\< EOF \> retail-store-ecs-ui-updated-taskdef.json
>
> {
>
> \"family\": \"retail-store-ecs-ui\",
>
> \"executionRoleArn\":
> \"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole\",
>
> \"taskRoleArn\":
> \"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskRole\",
>
> \"networkMode\": \"awsvpc\",
>
> \"requiresCompatibilities\": \[
>
> \"FARGATE\"
>
> \],
>
> \"cpu\": \"1024\",
>
> \"memory\": \"2048\",
>
> \"runtimePlatform\": {
>
> \"cpuArchitecture\": \"X86_64\",
>
> \"operatingSystemFamily\": \"LINUX\"
>
> },
>
> \"containerDefinitions\": \[
>
> {
>
> \"name\": \"application\",
>
> \"image\":
> \"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0\",
>
> \"portMappings\": \[
>
> {
>
> \"name\": \"application\",
>
> \"containerPort\": 8080,
>
> \"hostPort\": 8080,
>
> \"protocol\": \"tcp\",
>
> \"appProtocol\": \"http\"
>
> }
>
> \],
>
> \"essential\": true,
>
> \"linuxParameters\": {
>
> \"initProcessEnabled\": true
>
> },
>
> \"environment\": \[
>
> {
>
> \"name\": \"RETAIL_UI_BANNER\",
>
> \"value\": \"We\'ve updated the UI service!\"
>
> }
>
> \],
>
> \"healthCheck\": {
>
> \"command\": \[
>
> \"CMD-SHELL\",
>
> \"curl -f http://localhost:8080/actuator/health \|\| exit 1\"
>
> \],
>
> \"interval\": 10,
>
> \"timeout\": 5,
>
> \"retries\": 3,
>
> \"startPeriod\": 60
>
> },
>
> \"logConfiguration\": {
>
> \"logDriver\": \"awslogs\",
>
> \"options\": {
>
> \"awslogs-group\": \"retail-store-ecs-tasks\",
>
> \"awslogs-region\": \"\$AWS_REGION\",
>
> \"awslogs-stream-prefix\": \"ui-service\"
>
> }
>
> }
>
> }
>
> \]
>
> }
>
> EOF

Agora vamos usar o comando register-task-definition para atualizar a
definição da tarefa. aws ecs register-task-definition \--cli-input-json
file://retail-store-ecs-ui-updated-taskdef.json

É importante observar que as definições de tarefas do ECS são imutáveis,
o que significa que, após serem criadas, não podem ser modificadas. Em
vez disso, o comando acima criará uma nova revisão da definição de
tarefa, que é uma cópia da definição de tarefa atual com os novos
valores de parâmetros substituindo os existentes.

Você pode verificar se agora temos várias revisões de definição de
tarefas com o seguinte comando:

aws ecs list-task-definitions \--family-prefix retail-store-ecs-ui

O resultado mostrará todas as revisões da família de definição de
tarefas da interface do usuário:

> {

\"taskDefinitionArns\": \[

\"arn:aws:ecs:us-west-2123456789012:task-definition/retail-store-ecs-ui:1\",
\"arn:aws:ecs:us-west-2123456789012:task-definition/retail-store-ecs-ui:2\"

> \]
>
> }

Agora precisamos atualizar o serviço ECS para usar a nova revisão da
definição de tarefa:

aws ecs update-service \--cluster retail-store-ecs-cluster \--service ui
\--task-definition retail- store-ecs-ui

Aguarde até que o ECS implemente as alterações no serviço:

aws ecs wait services-stable \--cluster retail-store-ecs-cluster
\--services ui

Agora atualize o navegador e você verá que o banner foi adicionado com
base em nossas variáveis de ambiente:

![](media/image13.png){style="width:5.9322in;height:0.5in"}

Ativar o ECS Exec

Nesta seção, habilitaremos **o** recurso **ECS Exec** para executar
comandos ou obter um shell para um contêiner em execução na instância do
EC2 ou Fargate. A ativação do ECS Exec é benéfica para o gerenciamento
operacional e também vantajosa do ponto de vista da segurança. Ele
oferece acesso controlado aos contêineres em execução nas tarefas do
ECS, permitindo a solução de problemas segura, auditada e interativa sem
a necessidade de SSH nos hosts.

Ao aproveitar as políticas e funções do IAM, é possível controlar
rigorosamente quem tem acesso para executar comandos dentro dos
contêineres, melhorando assim a postura geral de segurança. Além disso,
todos os comandos executados por meio do ECS Exec são registrados no
CloudWatch, fornecendo uma trilha de auditoria para fins de conformidade
e monitoramento.
[[Mais]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html)
[[informações podem ser encontradas
aqui]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html)
.

As etapas são as seguintes:

> ![](media/image14.png) Definir a função IAM para o usuário
>
> ![](media/image14.png) Definir a função de IAM para a função de tarefa
> do ECS ![](media/image14.png) Configurar o ambiente
>
> ![](media/image15.png) Habilitar o Amazon ECS Exec no serviço
>
> ![](media/image14.png) Conectar-se à tarefa do ECS

## [Definir a funç ão de IAM para o usuário](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#set-the-iam-role-for-the-user)

Como vamos usar o ECS Exec do nosso IDE, precisamos garantir que a
função de IAM anexada ao IDE tenha as políticas de IAM necessárias.
Vamos atualizar a função de IAM associada à instância do EC2 que executa
nosso IDE adicionando a seguinte política em linha:

cat \<\< EOF \> ecs-exec-command-policy.json

{

\"Version\": \"2012-10-17\",

\"Statement\": \[

{

\"Effect\": \"Allow\",

\"Action\": \[

\"ecs:ExecuteCommand\",

\"ecs:DescribeTasks\"

\],

\"Resource\": \[

\"arn:aws:ecs:\${AWS_REGION}:\${ACCOUNT_ID}:task/retail-store-ecs-cluster/\*\",

\"arn:aws:ecs:\${AWS_REGION}:\${ACCOUNT_ID}:cluster/\*\"

\]

}

\]

}

EOF

aws iam put-role-policy \\

\--role-name \`aws sts get-caller-identity \--query \'Arn\' \| cut
-d\'/\' -f2\` \\

\--policy-name AmazonECSExecCommand \\

\--policy-document <file://ecs-exec-command-policy.json>

Expandir para verificar se a política está configurada corretamente.

Neste laboratório, adicionamos apenas a política de IAM mais básica, mas
podem ser necessárias políticas de IAM adicionais para utilizar vários
recursos do ECS Exec, como os registros do CloudWatch.

## 

## 

## 

## 

## 

## 

## 

## [Definir a funç ão de IAM para a funç ão de tarefa do ECS](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#set-the-iam-role-for-the-ecs-task-role)

O ECS Exec precisa de uma função de IAM de tarefa para a comunicação
SSM. Criamos previamente essa função de IAM para a tarefa **UI
Service**. Portanto, vamos apenas verificar suas permissões.

aws iam get-role-policy \\

\--role-name retailStoreEcsTaskRole \\

\--policy-name \`aws iam list-role-policies \--role-name
retailStoreEcsTaskRole \--query \'PolicyNames\[0\]\' \--output text\`

O resultado será o seguinte:

{

\"RoleName\": \"retailStoreEcsTaskRole\",

\"PolicyName\": \"RetailStoreEcsTaskRoleDefaultPolicy3AF87919\",

\"PolicyDocument\": {

\"Version\": \"2012-10-17\",

\"Statement\": \[

{

\"Action\": \[

\"ssmmessages:CreateControlChannel\",

\"ssmmessages:CreateDataChannel\",

\"ssmmessages:OpenControlChannel\",

\"ssmmessages:OpenDataChannel\"

\],

\"Resource\": \"\*\",

\"Effect\": \"Allow\"

}

\]

}

}

## [Configurar o ambiente](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#setup-the-environment)

Precisamos da CLI do AWS e do [plug-in do Session Manager para a CLI do
AWS]{.underline}. Esses dois utilitários já foram instalados no IDE para
este workshop. Consulte a documentação vinculada acima para fazer isso
em seu próprio ambiente.

## [Habilitar o Amazon ECS Exec na tarefa](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#enable-amazon-ecs-exec-on-the-task)

> Atualize o **serviço de interface do usuário** para ativar o Amazon
> ECS Exec \--enable-execute- command:

aws ecs update-service \\

\--cluster retail-store-ecs-cluster \\

\--service ui \\

\--task-definition retail-store-ecs-ui \\

\--enable-execute-command \\

\--force-new-deployment

Aguarde até que o ECS implemente as alterações no serviço:

aws ecs wait services-stable \--cluster retail-store-ecs-cluster
\--services ui

> Execute o seguinte comando para selecionar uma das **tarefas da
> interface do usuário** em execução com o enableExecuteCommand ativado:
>
> ECS_EXEC_TASK_ARN=\$(aws ecs list-tasks \--cluster
> retail-store-ecs-cluster \\
>
> \--service-name ui \--query \'taskArns\[\]\' \--output text \| \\
>
> xargs -n1 aws ecs describe-tasks \--cluster retail-store-ecs-cluster
> \--tasks \| \\
>
> jq -r \'.tasks\[\] \| select(.enableExecuteCommand == true) \|
> .taskArn\' \| \\
>
> head -n 1)

Verifique o resultado usando o comando echo.

echo \$ECS_EXEC_TASK_ARN

## [Conectar-se à tarefa do ECS](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic/600-ecs-exec#connect-to-the-ecs-task)

Inicie sua sessão interativa /bin/bash na tarefa em execução.

if \[ -z \${ECS_EXEC_TASK_ARN} \]; then echo \"ECS_EXEC_TASK_ARN is not
correctly configured!\"; else

aws ecs execute-command \--cluster retail-store-ecs-cluster \\

\--task \$ECS_EXEC_TASK_ARN \\

\--container application \\

\--interactive \\

\--command \"/bin/bash\"

fi

Você deverá ver um resultado como este:

> **The Session Manager plugin was installed successfully. Use the AWS
> CLI to start a session.**
>
> **Starting session with SessionId:
> ecs-execute-command-vvdysulqbcz2txr2d262sw2s64**
>
> **bash-5.2#**
>
> **Within a new session, you can execute the following commands:**
>
> **cat /etc/os-release**
>
> **df -h**
>
> **Terminate your session:**
>
> **exit**
>
> **Importante**

Você deve ter concluído os seguintes capítulos como pré-requisitos para
este laboratório: ![](media/image16.png)
[[Fundamentos]{.underline}](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/30-basic)

Como uma única instância do Fargate corresponde a uma única tarefa do
ECS, você precisa

especificar a CPU e a memória da tarefa durante a criação da definição
da tarefa. Portanto, é fundamental dimensionar corretamente as tarefas
do Fargate para garantir que elas possam desempenhar suas funções com o
nível de desempenho desejado. Se uma tarefa tiver dificuldades devido à
insuficiência de CPU ou memória para executar suas funções, isso indica
que a tarefa não está dimensionada corretamente e pode exigir recursos
adicionais. Você pode avaliar com precisão as necessidades do seu
aplicativo fazendo medições de desempenho, conduzindo testes de carga
abrangentes ou observando atentamente as principais métricas.

Quando estiver confiante de que suas tarefas têm o tamanho adequado,
você poderá dimensionar horizontalmente implantando tarefas adicionais
para lidar com mais solicitações. O escalonamento

horizontal é o método preferido para escalonar cargas de trabalho
nativas da nuvem e em contêineres.

O Amazon ECS oferece a capacidade de ajustar automaticamente o número
desejado de tarefas em seu serviço, um recurso conhecido como **Service
Auto Scaling**. O ECS Service Auto Scaling usa **[[o Application Auto
Scalin]{.underline}g](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html)**
para fornecer essa funcionalidade. E, para ser uma métrica de
dimensionamento útil e eficaz, essa métrica precisa ser
**proporcional**. Por proporcional, entende- se que ela deve ter um
comportamento específico. Por exemplo, se mantivermos o número de
tarefas em nosso serviço estável. E se a carga dobrar, o valor da
métrica também deverá dobrar.

No contexto do ECS, ao utilizar instâncias do EC2, também é importante
considerar o uso de [provedores de capacidade]{.underline} para
gerenciar a capacidade das instâncias do EC2, além do ECS Service Auto
Scaling. No entanto, este capítulo se concentra principalmente no
Fargate, portanto, não abordaremos os provedores de capacidade do ECS em
detalhes.

Escala automática de serviço

O Amazon ECS oferece uma integração perfeita com o **Amazon CloudWatch**
para facilitar o dimensionamento eficiente dos serviços do ECS com base
em métricas em tempo real. As métricas do Amazon ECS são transmitidas ao
CloudWatch em intervalos de um minuto, permitindo um monitoramento
preciso e decisões de dimensionamento oportunas. Quando essas métricas
excedem os limites definidos em sua política de dimensionamento, o
CloudWatch aciona um alarme que ajusta o número desejado de tarefas em
seu serviço de acordo. Esse processo de ajuste dinâmico aumenta a
capacidade desejada durante os eventos de scale-out e a diminui durante
os eventos de scale-in, garantindo a utilização ideal dos recursos.

O Amazon ECS oferece três estratégias sofisticadas de dimensionamento de
serviços:

> **Escalonamento de rastreamento de metas** Esse método visa manter a
> estabilidade de uma métrica de dimensionamento especificada, ajustando
> automaticamente o número de tarefas para atender a um valor-alvo
> predefinido. O escalonamento de rastreamento de metas é preferido por
> sua simplicidade e baixos requisitos de manutenção, o que o torna a
> opção ideal para empresas que buscam eficiência operacional sem
> intervenção manual constante.
>
> **Dimensionamento por etapas** O escalonamento por etapas permite
> maior controle sobre as ações de escalonamento. Os usuários podem
> selecionar métricas, definir valores-limite e definir ajustes de
> etapas para especificar quantos recursos devem ser adicionados ou
> subtraídos. Ele também permite períodos de avaliação de violação
> personalizáveis para alarmes de métricas, proporcionando uma abordagem
> personalizada para lidar com cargas de trabalho variáveis de forma
> eficaz.
>
> **Escalonamento programado** O escalonamento programado é melhor
> utilizado quando as ações de escalonamento podem ser antecipadas com
> base em padrões de demanda conhecidos. Essa estratégia é perfeita para
> aplicativos com flutuações previsíveis de tráfego, permitindo o
> gerenciamento proativo de recursos para garantir a estabilidade e o
> desempenho do serviço durante os horários de pico.

Esses métodos de dimensionamento permitem que as organizações aproveitem
todo o potencial do ECS, otimizando o custo e o desempenho ao alinhar a
alocação de recursos com a demanda real.

Escala de rastreamento de metas

Nesta seção, configuraremos o dimensionamento automático de serviços do
ECS usando o Target Tracking Scaling. Isso inclui determinar para quais
serviços configurar o dimensionamento

automático de aplicativos e aplicar as políticas de dimensionamento
apropriadas.

Vamos registrar o serviço de interface do usuário como um alvo
dimensionável com o Application Auto Scaling. Esse comando define o
intervalo de dimensionamento do serviço de interface do usuário de um
mínimo de 2 a um máximo de 10 tarefas.

> aws application-autoscaling register-scalable-target \\
>
> \--service-namespace ecs \\
>
> \--scalable-dimension ecs:service:DesiredCount \\
>
> \--resource-id service/retail-store-ecs-cluster/ui \\
>
> \--min-capacity 2 \\
>
> \--max-capacity 10

de escalonamento para nosso destino de escalonamento.

Comece criando um arquivo de configuração JSON para a política de
dimensionamento. Essa configuração utiliza o tipo de métrica predefinida
de **contagem de solicitações por destino** relacionado ao balanceador
de carga de aplicativos que roteia as solicitações para o serviço ECS.
Nesse caso, nosso objetivo é obter 1.500 solicitações por tarefa (ou
destino) do ECS.

Essa política de dimensionamento é apenas um exemplo. Você deve entender
o perfil de dimensionamento de suas cargas de trabalho específicas para
compreender as métricas e os limites de dimensionamento adequados antes
de ativar o dimensionamento automático.

cat \<\< EOF \> ui-scaling-policy.json

{

\"TargetValue\": 1500,

\"PredefinedMetricSpecification\": {

\"PredefinedMetricType\": \"ALBRequestCountPerTarget\",

\"ResourceLabel\": \"\$UI_ALB_PREFIX/\$UI_TG_PREFIX\"

}

}

EOF

Em seguida, aplique a política de dimensionamento com o seguinte
comando:

aws application-autoscaling put-scaling-policy \\

\--service-namespace ecs \\

\--scalable-dimension ecs:service:DesiredCount \\

\--resource-id service/retail-store-ecs-cluster/ui \\

\--policy-name ui-scaling-policy \--policy-type TargetTrackingScaling \\

\--target-tracking-scaling-policy-configuration
file://ui-scaling-policy.json

## 

## 

## 

## [Explorar o CloudWatch Alarm](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/40-auto-scaling/200-target-tracking#explore-cloudwatch-alarm)

Quando você navegar até a guia
**[[Alarmes]{.underline}](https://console.aws.amazon.com/cloudwatch/home#alarmsV2)**
no serviço CloudWatch, verá que a política de dimensionamento criou 2
alarmes do CloudWatch.

![](media/image17.jpeg){style="width:5.85268in;height:1.63875in"}

> ![](media/image18.png) O primeiro é um alarme **alto** que rastreia
> ALBRequestCountPerTarget \> 1500 para 3 pontos de dados em 3 minutos.
> Quando esse alarme entra em estado de ALARME, o serviço ECS aumenta a
> escala adicionando mais tarefas, o que deve reduzir a média de
> ALBRequestCountPerTarget na nova contagem de tarefas. Se o alarme
> permanecer no estado ALARM no próximo período de avaliação, mais
> tarefas serão adicionadas até que o número máximo de tarefas
> especificado por sua política de dimensionamento seja atingido.
>
> ![](media/image19.png) O segundo é um alarme **baixo**, que rastreia
> ALBRequestCountPerTarget \> 1350 para 15 pontos de dados em 15
> minutos. Esse alarme é usado para reduzir o número de tarefas quando o
> período de alta atividade termina. O escalonamento é mais lento por
> design para favorecer uma maior disponibilidade.

# Escala automática de acionamento

Nesta seção, vamos gerar alguma carga sintética para o nosso serviço de
interface do usuário para ver como ele é dimensionado.

Primeiro, verifique se o nome DNS do balanceador de carga está associado
ao nosso serviço de interface do usuário. Essa variável de ambiente
teria sido exportada como parte do capítulo fundamental.

> export RETAIL_ALB=\$(aws elbv2 describe-load-balancers \--name
> retail-store-ecs-ui \\
>
> \--query \'LoadBalancers\[0\].DNSName\' \--output text)
>
> echo \${RETAIL_ALB}

Em seguida, executaremos a [[ferramenta
hey]{.underline}](https://httpd.apache.org/docs/2.4/programs/ab.html)
para enviar solicitações ao caminho /home do serviço da interface do
usuário:

hey -n 1000000 -c 5 -q 40 http://\$RETAIL_ALB/home

A atividade de escalonamento será acionada quando o **alarme alto** da
métrica de escalonamento for violado por três períodos consecutivos de
um minuto. Se quiser esperar automaticamente até que o alarme seja
acionado, você pode executar este comando:

aws cloudwatch wait alarm-exists \--alarm-name-prefix \\

TargetTracking-service/retail-store-ecs-cluster/ui-AlarmHigh
\--state-value ALARM

Quando o alarme disparar, você notará que a contagem de tarefas do
serviço aumentará de 2 para um número maior:

aws ecs describe-tasks \\

\--cluster retail-store-ecs-cluster \\

\--tasks \$(aws ecs list-tasks \--cluster retail-store-ecs-cluster
\--query \'taskArns\[\]\' \--output text) \\

\--query \"tasks\[\*\].\[group, launchType, lastStatus, healthStatus,
taskArn\]\" \--output table

Você pode observar o alarme alto associado com a política de
dimensionamento em transição para o estado **ALARM** no console do
CloudWatch, como abaixo.

![](media/image20.jpeg){style="width:5.9523in;height:2.42344in"}

Você também pode verificar a guia **Events Lab**) na página UI Service
\> Serviço da IU \> para ver a atividade de dimensionamento, em que a
contagem desejada aumenta além da contagem inicial de tarefas.

> ![](media/image21.jpeg){style="width:5.91428in;height:2.99094in"}

Feche o gerador de carga pressionando Ctrl + C na janela do terminal.
Depois de alguns minutos, o número de tarefas deve voltar a ser 2 como o
número mínimo.

Trabalho em rede

Os aplicativos modernos, como o nosso aplicativo de amostra, geralmente
são criados a partir de vários componentes distribuídos que se comunicam
entre si. Por exemplo, o componente da interface do usuário se comunica
via API com o componente Catalog, que está vinculado a uma camada
persistente no MySQL, como na arquitetura abaixo.

![](media/image22.png){style="width:2.03344in;height:3.13031in"}

Neste capítulo, exploraremos os conceitos relevantes da rede do Amazon
ECS relacionados ao Fargate.

> ![](media/image23.png) [[Modo de rede do Amazon
> ECS]{.underline}](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/100-awsvpc-network-mode)
> ![](media/image24.png) [[ECS Service
> Connect]{.underline}](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect)

Modo de rede do Amazon ECS

Ao executar contêineres, é importante considerar as configurações de
rede do contêiner em

execução no host. [Consulte a documentação para obter mais informações
sobre como
escolhe]{.underline}[[r]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode.html)
[[um modo de
rede]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode.html).
Nesta seção, forneceremos uma visão geral da configuração de rede **do
modo AWSVPC** necessária para o Amazon ECS no Fargate.

No **modo AWSVPC,** o Amazon ECS cria e gerencia uma interface de rede
elástica ENI para cada tarefa, e cada tarefa recebe seu próprio
endereço IP privado dentro da VPC. Essa configuração oferece grande
flexibilidade para controlar as comunicações entre tarefas e serviços em
um nível mais granular. O modo de rede AWSVPC é compatível com as
tarefas do Amazon ECS hospedadas no Amazon EC2 e no Fargate. [[Para
obter mais informações, clique
aqui]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode-awsvpc.html).

Ao usar o Amazon ECS no Fargate, é necessário o modo de rede AWSVPC.

![](media/image25.jpeg){style="width:4.77562in;height:2.7in"}

> Nesta seção, analisaremos a configuração de rede do Amazon ECS.
> **[[Revise o modo de rede no cluster do Amazon ECS
> implantado]{.underline}](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/100-awsvpc-network-mode#review-the-network-mode-on-the-deployed-amazon-ecs-cluster)**
> Abra o console do Amazon ECS para inspecionar os serviços.

[[Abra o console do Amazon
ECS]{.underline}](https://console.aws.amazon.com/ecs/v2/clusters/retail-store-ecs-cluster/tasks)

> ![](media/image26.jpeg){style="width:5.94715in;height:3.83167in"}

A partir daí, você pode selecionar a primeira tarefa em execução. Role
até a seção **Configuração**

> para revisar o **modo de rede**, a **ID ENI** e o **IP privado**
> anexado à tarefa:

![](media/image27.jpeg){style="width:5.8314in;height:2.19927in"}

Você pode acessar as informações da tarefa de forma programática.
Execute o seguinte comando para obter as informações da tarefa em
execução no serviço de interface do usuário:

aws ecs describe-tasks \\

\--cluster retail-store-ecs-cluster \\

\--tasks \`aws ecs list-tasks \--cluster retail-store-ecs-cluster
\--service ui \--query \'taskArns\[0\]\' \--output text\`

{

\"tasks\": \[

{

\"attachments\": \[

{

\"id\": \"464044b3-626f-44da-86ec-fa20a064d408\",

\"type\": \"ElasticNetworkInterface\",

\"status\": \"ATTACHED\",

\"details\": \[

{

\"name\": \"subnetId\",

\"value\": \"subnet-08c4050330714ed3d\"

},

{

\"name\": \"networkInterfaceId\",

\"value\": \"eni-0a6c55131166f85c8\"

},

{

\"name\": \"macAddress\",

\"value\": \"06:39:15:1c:ae:1f\"

},

{

\"name\": \"privateDnsName\",

\"value\": \"ip-10-0-4-128.us-west-2.compute.internal\"

},

{

\"name\": \"privateIPv4Address\",

\"value\": \"10.0.4.128\"

}

\]

}

\],

\"attributes\": \[

{

\"name\": \"ecs.cpu-architecture\",

\"value\": \"x86_64\"

}

\],

\"availabilityZone\": \"us-west-2b\",

\"clusterArn\":
\"arn:aws:ecs:us-west-2:XXXXXXXXXX:cluster/retail-store-ecs-cluster\",

\"connectivity\": \"CONNECTED\",

\"connectivityAt\": \"2024-04-10T08:09:33.968000+00:00\",

\"containers\": \[

{

\"containerArn\":
\"arn:aws:ecs:us-west-2:XXXXXXXXXX:container/retail-store-ecs-cluster/70137dd0c1d14cf982e5a6b7446c5f54/db0fa651-1727-4215-b5a5-8a5577120942\",

\"taskArn\":
\"arn:aws:ecs:us-west-2:XXXXXXXXXX:task/retail-store-ecs-cluster/70137dd0c1d14cf982e5a6b7446c5f54\",

\"name\": \"application\",

\"image\":
\"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0\",

\"imageDigest\":
\"sha256:6316a3c331c39c35798f3b1303f80494526c0a879fe5a3db3b0b9a85c22aab36\",

\"runtimeId\": \"70137dd0c1d14cf982e5a6b7446c5f54-524788293\",

\"lastStatus\": \"RUNNING\",

\"networkBindings\": \[\],

\"networkInterfaces\": \[

{

\"attachmentId\": \"464044b3-626f-44da-86ec-fa20a064d408\",

\"privateIpv4Address\": \"10.0.4.128\"

}

\],

\"healthStatus\": \"HEALTHY\",

\"cpu\": \"0\"

}

\],

\"cpu\": \"1024\",

\"createdAt\": \"2024-04-10T08:09:29.943000+00:00\",

\"desiredStatus\": \"RUNNING\",

\"enableExecuteCommand\": false,

\"group\": \"service:ui\",

\"healthStatus\": \"HEALTHY\",

\"lastStatus\": \"RUNNING\",

\"launchType\": \"FARGATE\",

\"memory\": \"2048\",

\"overrides\": {

\"containerOverrides\": \[

{

\"name\": \"application\"

}

\],

\"inferenceAcceleratorOverrides\": \[\]

},

\"platformVersion\": \"1.4.0\",

\"platformFamily\": \"Linux\",

\"pullStartedAt\": \"2024-04-10T08:09:44.535000+00:00\",

\"pullStoppedAt\": \"2024-04-10T08:09:52.398000+00:00\",

\"startedAt\": \"2024-04-10T08:10:44.148000+00:00\",

\"startedBy\": \"ecs-svc/8962710467093341990\",

\"tags\": \[\],

\"taskArn\":
\"arn:aws:ecs:us-west-2:XXXXXXXXXX:task/retail-store-ecs-cluster/70137dd0c1d14cf982e5a6b7446c5f54\",

\"taskDefinitionArn\":
\"arn:aws:ecs:us-west-2:XXXXXXXXXX:task-definition/retail-store-ecs-ui:8\",

\"version\": 4,

\"ephemeralStorage\": {

\"sizeInGiB\": 20

}

}

\],

\"failures\": \[\]

}

📘 ECS Service Connect

> **O ECS Service Connect** é a maneira recomendada de lidar com a
> comunicação serviço a serviço,

fornecendo recursos de descoberta de serviço, conectividade e
monitoramento de tráfego. Com o Service Connect, seus aplicativos podem
usar nomes curtos e portas padrão para se conectar aos serviços do ECS
no mesmo cluster, em outros clusters, inclusive entre VPCs na mesma
região do AWS. [[Mais informações podem ser encontradas
aqui.]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-serviceconnect)

Outras opções para configurar a comunicação entre serviços no Amazon ECS
Services: ![](media/image28.png) [[Balanceador de carga
interno]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-elb)

> ![](media/image29.png) [[Descoberta de
> servi]{.underline}ç[os]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-direct)

**Habilitando o Service Connect**

Nesta seção, habilitaremos a conexão do serviço ECS em nosso cluster
implantando dois outros microsserviços com os quais o serviço de
interface do usuário se comunicará:

> ![](media/image30.png){style="width:5.91661in;height:3.21187in"}

## [Implantar o serviço Assets](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#deploy-the-assets-service)

Criar definição de tarefa ECS para o **serviço Assets**.

cat \<\< EOF \> retail-store-ecs-asset-taskdef.json

{

\"family\": \"retail-store-ecs-assets\",

\"executionRoleArn\":
\"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole\",

\"networkMode\": \"awsvpc\",

\"requiresCompatibilities\": \[

\"FARGATE\"

\],

\"cpu\": \"1024\",

\"memory\": \"2048\",

\"runtimePlatform\": {

\"cpuArchitecture\": \"X86_64\",

\"operatingSystemFamily\": \"LINUX\"

},

\"containerDefinitions\": \[

{

\"name\": \"application\",

\"image\":
\"public.ecr.aws/aws-containers/retail-store-sample-assets:0.7.0\",

\"cpu\": 0,

\"portMappings\": \[

{

\"name\": \"application\",

\"containerPort\": 8080,

\"hostPort\": 8080,

\"protocol\": \"tcp\",

\"appProtocol\": \"http\"

}

\],

\"essential\": true,

\"healthCheck\": {

\"command\": \[

\"CMD-SHELL\",

\"curl -f http://localhost:8080/health.html \|\| exit 1\"

\],

\"interval\": 10,

\"timeout\": 5,

\"retries\": 3,

\"startPeriod\": 60

},

\"logConfiguration\": {

\"logDriver\": \"awslogs\",

\"options\": {

\"awslogs-group\": \"retail-store-ecs-tasks\",

\"awslogs-region\": \"\$AWS_REGION\",

\"awslogs-stream-prefix\": \"assets-service\"

}

}

}

\]

}

EOF

> aws ecs register-task-definition \--cli-input-json
> file://retail-store-ecs-asset-taskdef.json Crie o serviço Assets ECS
> correspondente:

aws ecs create-service \\

\--cluster retail-store-ecs-cluster \\

\--service-name assets \\

\--task-definition retail-store-ecs-assets \\

\--desired-count 1 \\

\--launch-type FARGATE \\

\--network-configuration
\"awsvpcConfiguration={subnets=\[\${PRIVATE_SUBNET1},
\${PRIVATE_SUBNET2}\],
securityGroups=\[\$ASSET_SG_ID\],assignPublicIp=DISABLED}\" \\

\--service-connect-configuration \'{

\"enabled\": true,

\"namespace\": \"retailstore.local\",

\"services\": \[

{

\"portName\": \"application\",

\"discoveryName\": \"assets\",

\"clientAliases\": \[

{

\"port\": 80,

\"dnsName\": \"assets\"

}

\]

}

\]

}\'

Observe que, quando criamos esse serviço, especificamos
\--service-connect-configuration, que é:

> 1- Habilitando o Service Connect
>
> 2- Especificação de um namespace que todos os serviços compartilharão
>
> 3- Configurar os serviços do Service Connect que serão fornecidos por
> esse serviço ECS, incluindo seu alias e número de porta

[[Mais informa]{.underline}ç[ões podem ser encontradas
aqui.]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-connecting-services.html#networking-connecting-services-serviceconnect)

## [Implantar o serviço Catalog](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#deploy-the-catalog-service)

> Criar definição de tarefa ECS para o **serviço Catalog**.
>
> cat \<\< EOF \> retail-store-ecs-catalog-taskdef.json
>
> {
>
> \"family\": \"retail-store-ecs-catalog\",
>
> \"executionRoleArn\":
> \"arn:aws:iam::\${ACCOUNT_ID}:role/cataologEcsTaskExecutionRole\",
>
> \"networkMode\": \"awsvpc\",
>
> \"requiresCompatibilities\": \[
>
> \"FARGATE\"
>
> \],
>
> \"cpu\": \"1024\",
>
> \"memory\": \"2048\",
>
> \"runtimePlatform\": {
>
> \"cpuArchitecture\": \"X86_64\",
>
> \"operatingSystemFamily\": \"LINUX\"
>
> },
>
> \"containerDefinitions\": \[
>
> {
>
> \"name\": \"application\",
>
> \"image\":
> \"public.ecr.aws/aws-containers/retail-store-sample-catalog:0.7.0\",
>
> \"portMappings\": \[
>
> {
>
> \"name\": \"application\",
>
> \"containerPort\": 8080,
>
> \"hostPort\": 8080,
>
> \"protocol\": \"tcp\",
>
> \"appProtocol\": \"http\"
>
> }
>
> \],
>
> \"essential\": true,
>
> \"environment\": \[
>
> {
>
> \"name\": \"DB_NAME\",
>
> \"value\": \"catalog\"
>
> }
>
> \],
>
> \"secrets\": \[
>
> {
>
> \"name\": \"DB_ENDPOINT\",
>
> \"valueFrom\":
> \"arn:aws:ssm:\${AWS_REGION}:\${ACCOUNT_ID}:parameter/retail-store-ecs/catalog/db-endpoint\"
>
> },
>
> {
>
> \"name\": \"DB_PASSWORD\",
>
> \"valueFrom\":
> \"arn:aws:secretsmanager:\${AWS_REGION}:\${ACCOUNT_ID}:secret:retail-store-ecs-catalog-db:password::\"
>
> },
>
> {
>
> \"name\": \"DB_USER\",
>
> \"valueFrom\":
> \"arn:aws:secretsmanager:\${AWS_REGION}:\${ACCOUNT_ID}:secret:retail-store-ecs-catalog-db:username::\"
>
> }
>
> \],
>
> \"healthCheck\": {
>
> \"command\": \[
>
> \"CMD-SHELL\",
>
> \"curl -f http://localhost:8080/health \|\| exit 1\"
>
> \],
>
> \"interval\": 10,
>
> \"timeout\": 5,
>
> \"retries\": 3,
>
> \"startPeriod\": 60
>
> },
>
> \"logConfiguration\": {
>
> \"logDriver\": \"awslogs\",
>
> \"options\": {
>
> \"awslogs-group\": \"retail-store-ecs-tasks\",
>
> \"awslogs-region\": \"\$AWS_REGION\",
>
> \"awslogs-stream-prefix\": \"catalog-service\"
>
> }
>
> }
>
> }
>
> \]
>
> }
>
> EOF

aws ecs register-task-definition \--cli-input-json
file://retail-store-ecs-catalog-taskdef.json Crie o serviço Catalog ECS
correspondente:

aws ecs create-service \\

\--cluster retail-store-ecs-cluster \\

\--service-name catalog \\

\--task-definition retail-store-ecs-catalog \\

\--desired-count 1 \\

\--launch-type FARGATE \\

\--network-configuration
\"awsvpcConfiguration={subnets=\[\${PRIVATE_SUBNET1},
\${PRIVATE_SUBNET2}\],
securityGroups=\[\$CATALOG_SG_ID\],assignPublicIp=DISABLED}\" \\

\--service-connect-configuration \'{

\"enabled\": true,

\"namespace\": \"retailstore.local\",

\"services\": \[

{

\"portName\": \"application\",

\"discoveryName\": \"catalog\",

\"clientAliases\": \[

{

\"port\": 80,

\"dnsName\": \"catalog\"

}

\]

}

\]

}\'

## [Atualização do serviço de interface do usuário](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#updating-the-ui-service)

Antes de atualizarmos o serviço de interface do usuário, vamos aguardar
a conclusão da implantação dos novos serviços:

aws ecs wait services-stable \--cluster retail-store-ecs-cluster
\--services catalog aws ecs wait services-stable \--cluster
retail-store-ecs-cluster \--services assets

As seguintes variáveis de ambiente precisam ser adicionadas à definição
da tarefa de interface do usuário para vincular o serviço de interface
do usuário aos serviços de catálogo e de ativos:

> \"environment\": \[
>
> {
>
> \"name\": \"ENDPOINTS_CATALOG\",
>
> \"value\": \"http://catalog\"
>
> },
>
> {
>
> \"name\": \"ENDPOINTS_ASSETS\",
>
> \"value\": \"http://assets\"
>
> }
>
> Atualize a **definição da tarefa da interface do usuário** com as
> variáveis de ambiente.

cat \<\< EOF \> retail-store-ecs-ui-connect-taskdef.json

{

\"family\": \"retail-store-ecs-ui\",

\"executionRoleArn\":
\"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskExecutionRole\",

\"taskRoleArn\":
\"arn:aws:iam::\${ACCOUNT_ID}:role/retailStoreEcsTaskRole\",

\"networkMode\": \"awsvpc\",

\"requiresCompatibilities\": \[

\"FARGATE\"

\],

\"cpu\": \"1024\",

\"memory\": \"2048\",

\"runtimePlatform\": {

\"cpuArchitecture\": \"X86_64\",

\"operatingSystemFamily\": \"LINUX\"

},

\"containerDefinitions\": \[

{

\"name\": \"application\",

\"image\":
\"public.ecr.aws/aws-containers/retail-store-sample-ui:0.7.0\",

\"portMappings\": \[

{

\"name\": \"application\",

\"containerPort\": 8080,

\"hostPort\": 8080,

\"protocol\": \"tcp\",

\"appProtocol\": \"http\"

}

\],

\"essential\": true,

\"linuxParameters\": {

\"initProcessEnabled\": true

},

\"environment\": \[

{

\"name\": \"ENDPOINTS_CATALOG\",

\"value\": \"http://catalog\"

},

{

\"name\": \"ENDPOINTS_ASSETS\",

\"value\": \"http://assets\"

}

\],

\"healthCheck\": {

\"command\": \[

\"CMD-SHELL\",

\"curl -f http://localhost:8080/actuator/health \|\| exit 1\"

\],

\"interval\": 10,

\"timeout\": 5,

\"retries\": 3,

\"startPeriod\": 60

},

\"logConfiguration\": {

\"logDriver\": \"awslogs\",

\"options\": {

\"awslogs-group\": \"retail-store-ecs-tasks\",

\"awslogs-region\": \"\$AWS_REGION\",

\"awslogs-stream-prefix\": \"ui-service\"

}

}

}

\]

}

EOF

aws ecs register-task-definition \--cli-input-json
file://retail-store-ecs-ui-connect-taskdef.json

Agora, atualize o serviço de interface do usuário com a nova definição
de tarefa:

aws ecs update-service \\

\--cluster retail-store-ecs-cluster \\

\--service ui \\

\--task-definition retail-store-ecs-ui \\

\--force-new-deployment \\

\--service-connect-configuration \'{

\"enabled\": true,

\"namespace\": \"retailstore.local\",

\"services\": \[

{

\"portName\": \"application\",

\"discoveryName\": \"ui\",

\"clientAliases\": \[

{

\"port\": 80,

\"dnsName\": \"ui\"

}

\]

}

\]

}\'

echo \"Waiting for service to stabilize\...

aws ecs wait services-stable \--cluster retail-store-ecs-cluster
\--services ui

## [Explore o aplicativo da Web](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/100-enabling-service-connect#explore-web-application)

Como implantamos não apenas o serviço de interface do usuário, mas
também os serviços Assets e Catalog, a aparência do aplicativo mudou um
pouco.

export RETAIL_ALB=\$(aws elbv2 describe-load-balancers \--name
retail-store-ecs-ui \\

\--query \'LoadBalancers\[0\].DNSName\' \--output text)

echo \${RETAIL_ALB} ; echo

Cole o URL em um navegador da Web para acessar o aplicativo e você verá
uma tela como a que está abaixo.

![](media/image31.jpeg){style="width:5.95679in;height:5.04625in"}

Examinando os serviços

Abra o console do Amazon ECS para inspecionar os serviços. [Abra o
console do Amazon ECS]{.underline}

Agora você verá três serviços em execução no cluster:

![](media/image32.png){style="width:5.8023in;height:2.00594in"}

Navegar até a guia de tarefas mostrará 4 tarefas em execução:

![](media/image33.jpeg){style="width:5.93314in;height:2.22917in"}

Selecione uma das tarefas em execução e role para baixo até a seção
Contêineres. Na tela abaixo, você pode ver o aplicativo e os contêineres
de proxy. [[Mais informações podem ser
encontradas]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-concepts.html#service-connect-concepts-proxy)
[[aqui.]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-concepts.html#service-connect-concepts-proxy)

![](media/image34.png){style="width:5.92746in;height:1.39719in"}

## [O espaço de nomes](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/200-examining-the-services#the-namespace)

O Service Connect usa os namespaces [do AWS Cloud Map]{.underline} como
um agrupamento lógico de tarefas do Amazon ECS que se comunicam entre
si. Cada serviço do Amazon ECS pode pertencer a apenas um namespace. Os
serviços em um namespace podem ser distribuídos em diferentes clusters
do Amazon ECS na mesma região do AWS e na mesma conta do AWS.

Para revisar os Namespaces do cluster, abra o painel do Amazon ECS e, na
barra de navegação lateral, selecione **Namespace** para visualizar os
namespaces.

![](media/image35.png){style="width:5.86829in;height:1.22396in"}

Selecione o namespace para revisar os detalhes da configuração do AWS
Cloud Map associada a cada serviço. O **nome de descoberta** representa
o nome curto associado que pode ser usado para se conectar ao serviço
para serviços que são executados no mesmo namespace (http://assets).

> ![](media/image36.jpeg){style="width:5.89326in;height:3.07292in"}

Métricas

Agora podemos analisar as métricas que o Service Connect disponibiliza.

O Amazon ECS fornece métricas do CloudWatch que você pode usar para
monitorar seus recursos. [Veja a lista completa de métricas disponíveis
aqui]{.underline}.

Execute o seguinte comando para gerar algum tráfego sintético:

export RETAIL_ALB=\$(aws elbv2 describe-load-balancers \--name
retail-store-ecs-ui \\

\--query \'LoadBalancers\[0\].DNSName\' \--output text)

hey -n 1000000 -c 1 -q 10 <http://$RETAIL_ALB/home>

**Revise a métrica do ECS Service Connect no painel Traffic Health**

Abra o Amazon ECS Console, selecione o retail-store-ecs-cluster e abra a
guia Service.

![](media/image32.png){style="width:5.92071in;height:2.04687in"}

Selecione o serviço de interface do usuário e role para baixo até o
painel **Traffic Health**.

O Amazon ECS envia as seguintes métricas para o CloudWatch a cada
minuto. Quando o Amazon ECS coleta métricas, ele coleta vários pontos de
dados a cada minuto. [Mais informa]{.underline}ç[ões
pode]{.underline}[[m]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/available_cloudwatch_metrics.html)
[[ser encontradas
aqui]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/available_cloudwatch_metrics.html)

> ![](media/image37.jpeg){style="width:5.89491in;height:3.41062in"}

O Amazon ECS configura a tarefa e os contêineres de modo que os
aplicativos só se conectem ao proxy se o aplicativo estiver se
conectando aos nomes de endpoint no mesmo namespace. Todo o restante do
tráfego não usa o proxy. O outro tráfego inclui endereços IP no mesmo
VPC, endpoints de serviço do AWS e tráfego externo. [[Mais
informa]{.underline}ç[ões podem ser encontradas
aqui]{.underline}](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-concepts.html#service-connect-concepts-proxy).
É por isso que você não encontrará tráfego de saída para os serviços
Assets e Catalog.

## [Revisar a métrica do ECS Service Connect no Amazon CloudWatch](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/300-service-connect-metrics#review-ecs-service-connect-metric-on-amazon-cloudwatch)

Abra o console de [[métricas do Amazon
CloudWatch]{.underline}](https://console.aws.amazon.com/cloudwatch/home%23metricsV2?graph=~(view~%27timeSeries~stacked~false~stat~%27Average~period~300)&namespace=~%27AWS%2A2fECS):

![](media/image38.jpeg){style="width:5.84511in;height:3.25656in"}

> Clique nas métricas **Cluster, DiscoveryName, ServiceName** e procure
> por ui para revisar as métricas de tráfego.
>
> ![](media/image39.jpeg){style="width:5.93683in;height:3.41792in"}
>
> Você também pode pesquisar **Cluster, ServiceName,
> TargetDiscoveryName** para obter outras métricas.

Serviço de conexão avançada do ECS

Nesta seção, exploraremos os recursos do ECS Service Connect iniciando
uma sessão interativa nos contêineres em execução, para entender melhor
a configuração e os recursos do Service Connect.

## [Conectar-se à tarefa do ECS](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#connect-to-the-ecs-task)

Execute o seguinte comando para selecionar uma das tarefas em execução
com o enableExecuteCommand ativado:

> ECS_EXEC_TASK_ARN=\$(aws ecs list-tasks \--cluster
> retail-store-ecs-cluster \\
>
> \--service-name ui \--query \'taskArns\[\]\' \--output text \| \\
>
> xargs -n1 aws ecs describe-tasks \--cluster retail-store-ecs-cluster
> \--tasks \| \\
>
> jq -r \'.tasks\[\] \| select(.enableExecuteCommand == true) \|
> .taskArn\' \| \\
>
> head -n 1)
>
> echo \$ECS_EXEC_TASK_ARN

Isso produzirá o ARN da tarefa:

arn:aws:ecs:us-west-2:XXXXXXXXXX:task/retail-store-ecs-cluster/0564778486a846599b8bd6b544e5f6eb

Inicie sua sessão interativa /bin/bash na tarefa em execução:

if \[ -z \${ECS_EXEC_TASK_ARN} \]; then echo \"ECS_EXEC_TASK_ARN is not
correctly configured!\"; else

aws ecs execute-command \--cluster retail-store-ecs-cluster \\

\--task \$ECS_EXEC_TASK_ARN \\

\--container application \\

\--interactive \\

\--command \"/bin/bash"

fi

## 

## [Ambiente de configuração](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#setup-environment)

No shell do Bash, instale o comando jq no contêiner em execução para
formatar a saída json na linha de comando.

yum install jq -y

## [Explore o arquivo do host](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#explore-the-host-file)

O arquivo /etc/hosts fornece a correspondência do nome de domínio
totalmente qualificado

(FQDN) com os respectivos IPs. Revise o conteúdo do arquivo /etc/hosts
executando o seguinte comando.

cat /etc/hosts

127.0.0.1 localhost

X.X.X.X ip-X-X-X-X.us-west-2.compute.internal

127.255.0.1 assets

2600:f0f0:0:0:0:0:0:1 assets

127.255.0.2 catalog

2600:f0f0:0:0:0:0:0:2 catalog

127.255.0.3 ui

2600:f0f0:0:0:0:0:0:3 ui

O arquivo contém a configuração de 3 **nomes de descoberta** no espaço
de nomes do ECS com 3 IPs locais diferentes 127.255.0.X (IPv4 e IPv6).
Todos os IPs locais estão apontando para o mesmo proxy local do ECS que
redirecionará o tráfego para o proxy remoto do ECS correto vinculado ao
serviço específico.

## [Teste a conexão com o serviço Catalog](https://catalog.us-east-1.prod.workshops.aws/event/dashboard/en-US/workshop/60-networking/ecs-service-connect/400-service-connect-advanced#test-the-connection-to-the-catalog-service)

Teste a conexão com a API do Catalog a partir do contêiner em execução.
curl http://catalog/catalogue/tags \| jq

> \[
>
> {

\"name\": \"smart\", \"displayName\": \"Smart\"

> },
>
> {

\"name\": \"dress\",

\"displayName\": \"Dress\" (vestido)

> },
>
> {

\"name\": \"luxury\", \"displayName\": \"Luxury\" (luxo)

> },
>
> {

\"name\": \"casual\", \"displayName\": \"Casual\"

> }
>
> \]

Encerre sua sessão executiva:

exit
