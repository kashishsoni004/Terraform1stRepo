resource "aws_iam_role" "name" {
    name = "my-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            },
        ]
    })
  
}
# attach AWS managed policy to the role
resource "aws_iam_role_policy_attachment" "attach_example" {
    role       = aws_iam_role.name.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "policy_example" {
    path = "/"
    name = "my-policy"
    description = "mu policy description"
    
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # Bucket-level permission
      {
        Effect = "Allow"
        Action = "s3:ListBucket"
        Resource = "arn:aws:s3:::missmatch"
      },
    ]
  })
}
# attach the custom policy to a user

resource "aws_iam_role_policy_attachment" "attach_custom_policy" {
    role       = aws_iam_role.name.name
    policy_arn = aws_iam_policy.policy_example.arn
}
resource "aws_lambda_function" "lambda_function" {
  function_name = "lambda_function"
  role          = aws_iam_role.name.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 900
  memory_size   = 128
  filename      = "pythoncode.zip"  # Local path to your zip file. ensure this file exists in the same directory as your Terraform config
   
  source_code_hash = filebase64sha256("pythoncode.zip")
}
 resource "aws_s3_bucket" "New" {
  bucket = "missmatch"  # Ensure this bucket name is globally unique
  tags = {
    Name       = "My_lambda_function_bucket"
  }
}
resource "aws_s3_object" "lambda_object" {
  bucket = aws_s3_bucket.New.id
  key    = "pythoncode.zip"
  source = "pythoncode.zip"  # Local path to your zip file
}