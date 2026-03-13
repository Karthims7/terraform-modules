resource "aws_security_group" "alb_sg" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = var.security_group_name
  })
}

resource "aws_lb" "alb" {
  name               = var.name
  load_balancer_type = "application"

  subnets         = var.public_subnets
  security_groups = [aws_security_group.alb_sg.id]

  tags = merge(var.tags, {
    Name = var.name
  })
}