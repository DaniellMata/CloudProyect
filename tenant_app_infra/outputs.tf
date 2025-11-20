output "ec2_public_ip" {
  value = aws_instance.django.public_ip
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.pool.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.client.id
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
