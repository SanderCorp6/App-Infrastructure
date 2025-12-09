# Resources
# Key Pairs
resource "aws_key_pair" "rrhh_keys" {
    key_name = "${var.aws_key_pair_name}-${var.aws_env}"
    public_key = file("./keys/rrhh_key.pub")
}

# Security Groups
resource "aws_security_group" "rrhh_sg" {
    name = "${var.aws_sg_name}-${var.aws_env}"
    description = "SG for access through ssh"

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Api App"
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Postgres"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Postgres"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Postgres"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "rrhh-sg"
    }
}

# Create EC2
resource "aws_instance" "rrhh_app_instance" {
    ami = "ami-00271c85bf8a52b84"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.rrhh_sg.id ]
    key_name = aws_key_pair.rrhh_keys.key_name
    user_data_base64 = filebase64("${path.module}/scripts/docker-install.sh")

    provisioner "remote-exec" {
        connection {
            type = "ssh"
            host = self.public_ip
            user = "ubuntu"
            private_key = file("./keys/rrhh_key")
        }

        inline = [ 
            "mkdir -p /home/ubuntu/containers/init",
            "mkdir /home/ubuntu/.aws",
            
            "sudo mkdir -p /volumes/nginx/certs",
            "sudo mkdir -p /volumes/nginx/vhostd",
            "sudo mkdir -p /volumes/nginx/html",

            "sudo chmod -R 777 /volumes",
            "touch /home/ubuntu/containers/.env",

            "echo SERVICE=\"${var.api_service}\" >> /home/ubuntu/containers/.env",
            "echo EMAIL=\"${var.api_email}\" >> /home/ubuntu/containers/.env",
            "echo PASSWORD=\"${var.api_password}\" >> /home/ubuntu/containers/.env",
            "echo JWT_SECRET=\"${var.api_jwt_secret}\" >> /home/ubuntu/containers/.env",
            "echo JWT_EXPIRES_IN=\"${var.api_jwt_expiration}\" >> /home/ubuntu/containers/.env",
            "echo PORT=\"${var.api_port}\" >> /home/ubuntu/containers/.env",
            "echo DB_USER=\"${var.db_user}\" >> /home/ubuntu/containers/.env",
            "echo DB_HOST=\"${self.public_ip}\" >> /home/ubuntu/containers/.env",
            "echo DB_NAME=\"${var.db_name}\" >> /home/ubuntu/containers/.env",
            "echo DB_PASS=\"${var.db_pass}\" >> /home/ubuntu/containers/.env",
            "echo DB_PORT=\"${var.db_port}\" >> /home/ubuntu/containers/.env",
            "echo FRONTEND_URL=\"${var.frontend_url}\" >> /home/ubuntu/containers/.env",
            "echo AWS_ACCESS_KEY=\"${var.aws_access_key}\" >> /home/ubuntu/containers/.env",
            "echo AWS_SECRET_KEY=\"${var.aws_secret_key}\" >> /home/ubuntu/containers/.env",
            "echo AWS_REGION=\"${var.aws_region}\" >> /home/ubuntu/containers/.env",
            "echo AWS_BUCKET_NAME=\"${var.aws_bucket_name}\" >> /home/ubuntu/containers/.env",

            "echo RRHH_API_IMAGE=\"${var.api_image}\" >> /home/ubuntu/containers/.env",
            "echo VITE_API_URL=\"${var.api_url}\" >> /home/ubuntu/containers/.env",
            "echo RRHH_APP_IMAGE=\"${var.app_image}\" >> /home/ubuntu/containers/.env",
            "echo MAIN_DOMAIN=\"${var.main_domain}\" >> /home/ubuntu/containers/.env",

            "sudo echo \"[default]\naws_access_key_id=${var.aws_access_key}\naws_secret_access_key=${var.aws_secret_key}\" | sudo tee /home/ubuntu/.aws/credentials >/dev/null",
            "sudo echo \"[default]\nregion=${var.aws_region}\noutput=json\" | sudo tee /home/ubuntu/.aws/config >/dev/null",
            "sudo chown -R ubuntu:ubuntu /home/ubuntu/.aws",
            "sudo chmod 700 /home/ubuntu/.aws",
            "sudo chmod 600 /home/ubuntu/.aws/credentials /home/ubuntu/.aws/config"
         ]
    }

    provisioner "file" {
        source = "${path.module}/containers/docker-compose.yml"
        destination = "/home/ubuntu/containers/docker-compose.yml"

        connection {
            type = "ssh"
            host = self.public_ip
            user = "ubuntu"
            private_key = file("./keys/rrhh_key")
        }
    }

    provisioner "file" {
        source = "${path.module}/scripts/01_create_tables.sql"
        destination = "/home/ubuntu/containers/init/01_create_tables.sql"

        connection {
            type = "ssh"
            host = self.public_ip
            user = "ubuntu"
            private_key = file("./keys/rrhh_key")
        }
    }

    provisioner "file" {
        source = "${path.module}/scripts/02_insert_data.sql"
        destination = "/home/ubuntu/containers/init/02_insert_data.sql"

        connection {
            type = "ssh"
            host = self.public_ip
            user = "ubuntu"
            private_key = file("./keys/rrhh_key")
        }
    }
    
    tags = {
        Name = "${var.aws_server_name}-${var.aws_env}"
    }
}

resource "time_sleep" "wait_60_seconds" {
    depends_on = [ aws_instance.rrhh_app_instance ]
    create_duration = "90s"
}

resource "null_resource" "aws_configure" {
    depends_on = [ time_sleep.wait_60_seconds ]
    provisioner "remote-exec" {
        connection {
            type = "ssh"
            host = aws_instance.rrhh_app_instance.public_ip
            user = "ubuntu"
            private_key = file("./keys/rrhh_key")
        }

        inline = [ 
            "if ! command -v aws >/dev/null 2>&1; then sudo apt-get update -y && sudo apt-get install -y unzip curl jq && curl -sSL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && unzip -q awscliv2.zip && sudo ./aws/install && rm -rf awscliv2.zip aws; fi",
            "aws --version",
            "aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 253819957604.dkr.ecr.us-west-1.amazonaws.com",
            "cd containers",
            "docker compose up -d"
        ]
    }
}