provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.20.0.0/16"
}


resource "aws_subnet" "test_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.20.10.0/24"

  tags = {
    Name = "test"
  }
}

## Main section
data "aws_ami" "test_ami" {
  most_recent       = "${var.isTrue}"
  executable_users  = ["all","self"]
    owners           = ["self"]
  filter {
    name    = "name"
    values  = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name    = "architecture"
    values  = ["x86_64"]
  }
  filter {
    name    = "virtualization-type"
    values  = ["hvm"]
  }
  filter {
    name    = "state"
    values  = ["available"]
  }
  filter {
    name    = "root-device-type"
    values  = ["ebs"]
  }
}

data "template_file" "test" {
  template = "${file("${path.module}/template/user-data.tpl")}"
}

## EC2 creation
resource "aws_instance" "test_ec2" {
  count                       = "${var.instance_count}"
  instance_type               = "${var.instance_type}"
  ami                         = "${data.aws_ami.test_ami.id}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${aws_subnet.test_subnet.id}"
  user_data                   = "${data.template_file.test.rendered}"
  vpc_security_group_ids      = ["${aws_security_group.test_ec2_sg.id}"]
  associate_public_ip_address = true
  root_block_device {
      volume_type             = "${var.volume_type}"
      volume_size             = "${var.volume_size_root}"
      delete_on_termination   = "${var.isTrue}"   #change later
    }
  tags = {
    Name                      = "${var.name_ec2}-${var.environment}"
    Environment               = "${var.environment}"
  }
}