resource "aws_instance" "projeto_next" {
  ami                    = "ami-098e39bafa7e7303d" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = "t3.micro"
  key_name               = "chave-next-prod"
  vpc_security_group_ids = [aws_security_group.next_sg.id]
  iam_instance_profile   = "ECR-EC2-Role"
  tags = {
    Name        = "projeto_next"
    Provisioned = "Terraform"
    Cliente     = "Guilherme"
  }
}

## Security Group
resource "aws_security_group" "next_sg" {
  name = "next-sg"

  vpc_id = "vpc-0ad4aec5fd41e4527"

  tags = {
    Name        = "next-sg"
    Provisioned = "Terraform"
    Cliente     = "Guilherme"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.next_sg.id
  cidr_ipv4         = "38.252.204.7/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.next_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.next_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.next_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1

}