resource "aws_cognito_user_pool" "pool" {
  name = "tenant-user-pool"
}

resource "aws_cognito_user_pool_client" "client" {
  name         = "tenant-app-client"
  user_pool_id = aws_cognito_user_pool.pool.id
  generate_secret = false
}
