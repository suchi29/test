#
# RDS resources
#
resource "aws_db_instance" "test_postgresql" {
  allocated_storage               = "${var.allocated_storage}"
  engine                          = "postgres"
  engine_version                  = "${var.engine_version}"
  identifier                      = "${var.database_identifier}"
  snapshot_identifier             = "${var.snapshot_identifier}"
  instance_class                  = "${var.rds_instance_type}"
  storage_type                    = "${var.storage_type}"
  iops                            = "${var.iops}"
  name                            = "${var.database_name}"
  password                        = "${var.database_password}"
  username                        = "${var.database_username}"
  backup_retention_period         = "${var.backup_retention_period}"
  backup_window                   = "${var.backup_window}"
  maintenance_window              = "${var.maintenance_window}"
  auto_minor_version_upgrade      = "${var.auto_minor_version_upgrade}"
  final_snapshot_identifier       = "${var.final_snapshot_identifier}"
  skip_final_snapshot             = "${var.skip_final_snapshot}"
  copy_tags_to_snapshot           = "${var.copy_tags_to_snapshot}"
  multi_az                        = "${var.multi_availability_zone}"
  port                            = "${var.database_port}"
  vpc_security_group_ids          = "${[aws_security_group.test_rds_sg.id]}"
  db_subnet_group_name            = "${var.subnet_group}"
  parameter_group_name            = "${var.parameter_group}"
  storage_encrypted               = "${var.storage_encrypted}"
  monitoring_interval             = "${var.monitoring_interval}"
  deletion_protection             = "${var.deletion_protection}"
  tags =     {
      Name        = "${var.name_rds}",
      Environment = "${var.environment}"
  }
}