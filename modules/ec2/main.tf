resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = "ami-05c172c7f0d3aed00"
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  instance_type          = var.instance_type
  user_data              = <<-EOF
            #!/bin/bash

            # Update System
            apt update -y

            # Install Apache web
            apt install apache2 wget unzip -y

            # download template
            wget https://www.tooplate.com/zip-templates/2089_meteor.zip

            # unzip file
            unzip 2089_meteor.zip

            # Copy file to apache root
            cp 2089_meteor/* -r /var/www/html/

            # start apache2 server
            systemctl start apache2
            systemctl enable apache2
            systemctl status apache2            
        EOF

  user_data_replace_on_change = true

  tags = {
    Name = "${var.project_name}-${count.index + 1}"
  }
}