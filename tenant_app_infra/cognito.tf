resource "aws_cognito_user_pool" "tenant_pool" {
  name = "tenant-user-pool"
}

resource "aws_cognito_user_pool_client" "tenant_client" {
  name         = "tenant-app-client"
  user_pool_id = aws_cognito_user_pool.tenant_pool.id
  generate_secret = false
}

