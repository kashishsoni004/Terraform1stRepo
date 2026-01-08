# terraform {
#   backend "s3" {
#     bucket = "missmatchsecion"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     use_lockfile = true 
#   }
# }
terraform {
  backend "s3" {
    bucket = "missmatchsecion"
    key    = "terraform.tfstate"
    region = "us-east-1"
    # Enable S3 native locking
    use_lockfile = true 
    # The dynamodb_table argument is no longer needed

  }
}