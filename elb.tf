data "aws_subnet_ids" "private" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  tags = {
    Environment = "${var.environment}"
  }
}
#elb creation
resource "aws_elb" "test_elb" {
  connection_draining       = "${var.isTrue}"
  cross_zone_load_balancing = "${var.isTrue}"
  name                      = "${var.name_lb}"
  #subnets                   = ["${data.aws_subnet.private_1.*.id}","${data.aws_subnet.private_2.*.id}","${data.aws_subnet.private_3.*.id}"]
  subnets                   = "${aws_subnet.test_subnet.id}"
  internal                  = "${var.internal_elb}"
  security_groups           = ["${aws_security_group.test_lb_sg.id}"]
  instances                 = ["${aws_instance.test_ec2.id}"]

  listener {
    instance_port           = 80
    instance_protocol       = "${var.protocol}"
    lb_port                 = 80
    lb_protocol             = "ssl"
  }
  /*
  listener {
    instance_port           = 443
    instance_protocol       = "${var.protocol}"
    lb_port                 = 443
    lb_protocol             = "ssl"
  }*/
  health_check {
    target                  = "HTTP:80/"
    healthy_threshold       = 10
    unhealthy_threshold     = 10
    interval                = 300
    timeout                 = 60
  }
  tags = {
    Name                    = "${var.name_lb}"
    Environment             = "${var.environment}"
  }
}