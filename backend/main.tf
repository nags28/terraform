provider "aws"{
 region = "us-east-2"
 access_key = ""
 secret_key = ""
}

resource "aws_instance" "ec2attchment" {
    ami = "ami-02f706d959cedf892"
    instance_type = "t2.micro"
    key_name= "control_server"

}



