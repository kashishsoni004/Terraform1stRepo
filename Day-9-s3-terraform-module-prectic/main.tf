provider "aws" {
    region = "us-east-1"
  
}

module "s3_bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"

    bucket = "ydygdhjdidosuhdnxkkxklsxksjdshj"
   # acl    = "private"
  
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"


    versioning = {
        enabled = true
    }
  
}