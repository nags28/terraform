provider "aws"{
 region = "us-east-2"
 access_key = ""
 secret_key = ""
}
resource "aws_kms_key" "kms" {
    description = "KMS key "
    deletion_window_in_days = "7"
  
}

resource "aws_instance" "ec2attchment" {
    ami = "ami-02f706d959cedf892"
    availability_zone = "us-east-2a"
    instance_type = "t2.micro"

    tags = {
        Name = "ec2-instanec"
    }
  
}

resource "aws_ebs_volume" "volume1" {
    availability_zone = "us-east-2a"
    size = 1
    encrypted = true
     kms_key_id = "${aws_kms_key.kms.arn}"  

  
}


resource "aws_volume_attachment" "ebsattchment" {
    device_name = "/dev/sdh"
    volume_id = "${aws_ebs_volume.volume1.id}"
    instance_id = "${aws_instance.ec2attchment.id}"
  
}
