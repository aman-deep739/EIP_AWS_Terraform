provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-010aff33ed5991201"
    instance_type = "t2.micro"
    tags = { 
        Name = "tf ec2"
    }
}

resource "aws_eip" "elasticeip" {
        instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}