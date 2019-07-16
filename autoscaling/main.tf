provider "aws"{
 region = "us-east-2"
 access_key = ""
 secret_key = ""
}
resource "aws_launch_configuration" "launch" {
    name = "launch"
    image_id = "ami-02f706d959cedf892"
    instance_type = "t2.micro"
    security_groups = [ "${aws_security_group.sg.name}" ]
  
}
resource "aws_security_group" "sg" {
    name = "sg"
    description = "tls inbound traffic"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "-1"
        
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
  
}
resource "aws_autoscaling_group" "sample" {
    name = "sample"
    max_size = 5
    min_size = 2
    launch_configuration = "${aws_launch_configuration.launch.name}"
    availability_zones = [ "us-east-2b" ]
  
}
