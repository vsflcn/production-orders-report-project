provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

resoure "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/24"
}

resoure "aws_security_group" "main" {
    vpc_id = aws_vps.main.id

    ingress {
        from_port   = 22  # allow SSH access
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80  # allow HTTP access
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0  # allow all outbound traffic
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}