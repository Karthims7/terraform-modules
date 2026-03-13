module "backend" {
  source = "../modules/backend"

  bucket_name    = var.backend_bucket_name
  dynamodb_table = var.backend_dynamodb_table
  tags           = merge(local.common_tags, { Component = "terraform-backend" })
}