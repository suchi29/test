output "security_group_id" {
  value = "${aws_security_group.test_ec2_sg.id}"
}

output "security_group_id_lb" {
  value = "${aws_security_group.test_lb_sg.id}"
}
output "security_group_id_rds" {
  value = "${aws_security_group.test_rds_sg.id}"
}


output "instance_id" {
  value = "${aws_instance.test_ec2.id}"
}

output "elb_id" {
  value = "${aws_elb.test_elb.id}"
}

output "lb_dns_name" {
  value = "${aws_elb.test_elb.dns_name}"
}

output "security_group_rule" {
  value = "${aws_security_group_rule.extra_rule.id}"
}

output "bucket_id" {
  value = "${aws_s3_bucket.test_s3.id}"
}

output "name" {
  value = "${aws_s3_bucket.test_s3.bucket}"
}

output "arn" {
  value = "${aws_s3_bucket.test_s3.arn}"
}
output "id" {
  value       = "${aws_db_instance.test_postgresql.id}"
}

output "hosted_zone_id" {
  value       = "${aws_db_instance.test_postgresql.hosted_zone_id}"
}

output "hostname" {
  value       = "${aws_db_instance.test_postgresql.address}"
}

output "port" {
  value       = "${aws_db_instance.test_postgresql.port}"
}

output "endpoint" {
  value       = "${aws_db_instance.test_postgresql.endpoint}"
}
