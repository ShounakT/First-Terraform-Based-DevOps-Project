terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.2"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
        bucket         = "mytf3shounaktodankar"
        key            = "ShouDevOps/write_your_first_terraform_project/aws/local_state/terraform.tfstate"
        region         = "ap-south-1"
        dynamodb_table = "MyFirstDynamoDBShounakT"
        encrypt        = true
  }

}

provider "aws" {
  region  = "ap-south-1"
  access_key = "your_access_key"
  secret_key = "your_secret_key"
}

resource "aws_instance" "app_server" {
  ami           = "ami_id"
  instance_type = "t2.micro"

  tags = {
    Name = "MyDevOpsServer2"
  }
}

resource "aws_s3_bucket" "my_unique_bucket" {
  bucket = "mytf3shounaktodankar"
  tags = {
    Name        = "MyFirstS3BucketShounakTodankar"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "MyFirstDynamoDBShounakT"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
