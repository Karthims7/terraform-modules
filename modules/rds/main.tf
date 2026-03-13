resource "aws_db_subnet_group" "rds" {
  name       = var.subnet_group_name
  subnet_ids = var.private_subnets

  tags = merge(var.tags, {
    Name = var.subnet_group_name
  })
}

resource "aws_db_instance" "postgres" {
  identifier        = var.identifier
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username = var.username
  password = var.password

  db_subnet_group_name = aws_db_subnet_group.rds.name

  publicly_accessible = false
  storage_encrypted   = true
  skip_final_snapshot = true

  tags = merge(var.tags, {
    Name = var.identifier
  })
}