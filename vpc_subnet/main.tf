provider "aws"{
 region = "us-east-2"
 access_key = ""
 secret_key = ""
}
resource "aws_vpc" "terraform" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "terraform"
    }
  
}
resource "aws_subnet" "terraform_subnet1" {
    vpc_id = "${aws_vpc.terraform.id}"
    cidr_block = "192.168.1.0/24"
    
    tags = {
        Name = "subnet1"
    }
    
  
}
resource "aws_subnet" "terraform_subnet2" {
    vpc_id = "${aws_vpc.terraform.id}"
    cidr_block = "192.168.2.0/24"
    tags = {
        Name = "subnet2"
    }
  
}

resource "aws_internet_gateway" "terraform_practice" {
    vpc_id = "${aws_vpc.terraform.id}"
    tags = {
        Name = "terraform_practice"
    }

  
}


