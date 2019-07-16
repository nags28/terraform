provider "aws" {
    region = "us-east-2"
    
  
}


module "backend" {
 source = "../backend"
  
}

terraform {
    backend "s3"{
    encrypt = true
    bucket = "terraform-state-storage-s3-practice"
    dynamodb_table = "test"
    region = "us-east-2"
    key = "terraform.tfstate"   

    }
}
