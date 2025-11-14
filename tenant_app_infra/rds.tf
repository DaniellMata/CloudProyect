resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "tenant-db-subnet-group"
  subnet_ids = [aws_subnet.public_subnet.id]

  tags = {
    Name = "tenant-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "tenant-rds-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
  identifier         = "tenant-postgres"
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_name            = "tenantdb"
  username           = "admin"
  password           = "Password123!"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot = true
  publicly_accessible = true
}
