# AWS EC2 SPOT INSTANCE
resource "aws_spot_instance_request" "allows_rabbitmq" {
  ami                    = data.aws_ami.image.id
  subnet_id              = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS[0]
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allows_rabbitmq.id]
  wait_for_fulfillment   = true

  tags = {
    Name = "roboshop-rabbitmq-${var.ENV}" 
  }
}   

resource "null_resource" "app_install" {
  provisioner "remote-exec" {
    
  # connection block establishes connection to this 
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = aws_spot_instance_request.allows_rabbitmq     #aws_instance.sample.private_ip : use this only if your provisioner is outside the resourcee
  }
    inline = [
      "ansible-pull -U https://github.com/jogendra-b54/ansible.git  -e ENV=dev -e COMPONENT=rabbitmq roboshop-pull.yml",
    ]
  }

} 
 