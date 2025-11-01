terraform{
    required_providers{
        aws = {

            source = "hashicorp/aws"
            version = "~>4.16"

        }

    }
    required_version = ">=1.2.0"
    backend "s3"{

        bucket = "mytf3shounaktodankar"
        dynamodb_table = "myDevOpsDynamoDBShounakTodankar"
        key = "myFiles/myTFStateFile/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true

    }
}

provider "aws" {

    region = "ap-south-1"

}


resource "aws_instance" "myDevOpsEC2" {
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t2.micro"

  tags = {
    Name = "myDevOpsEC2"
  }
}

resource "aws_s3_bucket" "my_unique_bucket" {
  bucket = "mytf3shounaktodankar"
  tags = {
    Name        = "myDevOpsS3BucketShounakTodankar"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = "mytf3shounaktodankar"
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = "mytf3shounaktodankar"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "example" {
  name             = "myDevOpsDynamoDBShounakTodankar"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
