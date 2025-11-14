output "ec2_public_ip" {
  value = aws_instance.django_server.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.tenant_pool.id
}
