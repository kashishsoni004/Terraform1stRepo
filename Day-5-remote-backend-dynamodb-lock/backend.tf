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
    bucket = "missmatch"
    key    = "terraform.tfstate"
    region = "us-east-1"
    # Enable S3 native locking
    # use_lockfile = true #tf virsion should be 1.10 or above
    # The dynamodb_table argument is no longer needed
     dynamodb_table = "tf-lock-table"
      encrypt        = true

  }
}