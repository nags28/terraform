provider "aws" {
 region = "us-east-2"
 access_key = ""
 secret_key = ""
  
}

resource "aws_instance" "ec2_pro" {
    ami =" ami-0c929bde1796e1484"
    instance_type = "t2.micro"
    key_name= "control_server"
    security_groups= ["${aws_security_group.ALLTRAFFIC.name}"]
    tags = {
        Name = "ec2_pro"
    }
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("./control_server.pem")}"
      host = "${aws_instance.ec2_pro.public_ip}"
    }
    provisioner "remote-exec" {
            inline=[ "sudo apt-get update",
                     "sudo apt-get install tomcat7 -y"]

    }
    provisioner "file" {
            source      = "/var/lib/jenkins/workspace/game/gameoflife-web/target/gameoflife.war"
            destination = ""

    
    
    }




}


resource "aws_security_group" "ALLTRAFFIC" {
    name="ALLTRAFFIC"

    ingress {
        from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

egress {
       from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]

}
 }