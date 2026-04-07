terraform {

  backend "s3" {
    bucket         = "punit-terraform-state-bucket"
    key            = "terraform-infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }

}