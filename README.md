# tf-module-rabbitmq

```
AMAZON MQ   is a managed service offered in AWS for RabbitMQ .

But our application is not compatible with the version provided by AWS Amazon MQ . Hence we will stick to creating a VM and install RabbitMQ on the top of it.

```

```
All the terraform code to provision RabbitMQ  will be hosted in this repository
This will be the backend module , which will be called from the root module "terraform-database"


```

### Here is the plan :

```
    * we Will create a t3.micro  VM in the private Subnet 1
    * we will install rabbitMQ on the top of it
    * using remote_provisioner , we are going to configure RabbitMQ on the top of the VM .

```
