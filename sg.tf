resource "aws_security_group" "test_lb_sg" {
  name              = "${var.name_lb_sg}"
  description       = "security group for test load balancer"
  vpc_id            = "${aws_vpc.test_vpc.id}"

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "${var.protocol}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "${var.protocol}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "${var.protocol}"
    security_groups = ["${aws_security_group.test_ec2_sg.id}"]
  }
  tags = {
    Name            = "${var.name_lb_sg}"
    Environment     = "${var.environment}"
  }
}

resource "aws_security_group" "test_ec2_sg" {
  name              = "${var.name_ec2_sg}"
  description       = "Allows communication between alb and ec2"
  vpc_id            = "${aws_vpc.test_vpc.id}"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "${var.protocol}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "${var.protocol}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "${var.protocol}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "${var.protocol_all}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name            = "${var.name_ec2_sg}"
    Environment     = "${var.environment}"
  }
}

resource "aws_security_group_rule" "extra_rule" {
  security_group_id        = "${aws_security_group.test_ec2_sg.id}"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  type                     = "ingress"
  source_security_group_id = "${aws_security_group.test_lb_sg.id}"
}

resource "aws_security_group" "test_rds_sg" {
  name              = "${var.name_rds_sg}"
  description       = "Allows communication between rds and ec2"
  vpc_id            = "${aws_vpc.test_vpc.id}"

  ingress {
    from_port               = 5432
    to_port                 = 5432
    protocol                = "${var.protocol}"
    source_security_group_id= "${aws_instance.test_ec2.id}"
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "${var.protocol_all}"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name            = "${var.name_rds_sg}"
    Environment     = "${var.environment}"
  }
}