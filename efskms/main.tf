provider "aws"{
 region = "us-east-2"
 access_key = ""
 secret_key = ""
}
resource "aws_kms_key" "kms" {
    description = "KMS key "
    deletion_window_in_days = "7"
  
}

resource "aws_efs_file_system" "efs" {
    creation_token = "file_system"
    encrypted = "true"
    kms_key_id = "${aws_kms_key.kms.arn}"

}
resource "aws_efs_mount_target" "mounting" {
    file_system_id = "${aws_efs_file_system.efs.id}"
    subnet_id = "${aws_subnet.mysubnet.id}"
}

resource "aws_vpc" "efs_vpc" {
    cidr_block = "172.31.0.0/16"
  
}
resource "aws_subnet" "mysubnet" {
    vpc_id = "${aws_vpc.efs_vpc.id}"
    availability_zone = "us-east-2b"
    cidr_block = "172.31.0.0/24"
  
}