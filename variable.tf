variable "name_sg"            {}
variable "region"             {}
variable "vpc_id"             {}
variable "name_lb_sg"         {}
variable "name_rds_sg"         {}
variable "environment"        {}
variable "name_ec2_sg"        {}
variable "protocol"           {}
variable "protocol_all"       {}
variable "root_domain_name"   {}
variable "isIssued"           {}
variable "instance_count"     {}
variable "isTrue"             {}
variable "name_lb"            {}
variable "name_rds"            {}
variable "internal_elb"       {}
variable "subnet_name_1"      {}
#variable "subnet_name_2"      {}
#variable "subnet_name_3"      {}
variable "availability_zone_a"{}
variable "instance_type"      {}
variable "key_name"           {}
variable "volume_type"        {}
variable "volume_size_root"   {}
variable "name_ec2"           {}
variable "zone_name"          {}
variable "www_domain_name"    {}
variable "bucket_acl"         {}
variable "subnet_count"       {}
variable "environment_test"   {}
variable "subnet_id"          {}
variable "allocated_storage"  {}
variable "engine_version"     {}
variable "rds_instance_type"  {}
variable "snapshot_identifier"{}
variable "database_identifier"{}
variable "iops"               {}
variable "storage_type"       {}
variable "database_name"      {}
variable "database_username"  {}
variable "database_password"  {}
variable "backup_retention_period" {}
variable "database_port"      {}
variable "backup_window"      {}
variable "maintenance_window" {}
variable "final_snapshot_identifier" {}
variable "multi_availability_zone" {
  type = bool
}
variable "copy_tags_to_snapshot" {
  type = bool
}
variable "skip_final_snapshot" {
  type = bool
}
variable "auto_minor_version_upgrade" {
  type = bool
}
variable "storage_encrypted" {
  type = bool
}
variable "monitoring_interval" {
  type = number
}
variable "deletion_protection" {
  type = bool
}
variable "cloudwatch_logs_exports" {
  type = list
}
variable "subnet_group" {}
variable "parameter_group" {}
variable "alarm_cpu_threshold" {
  type = number
}
variable "alarm_disk_queue_threshold" {
  type = number
}
variable "alarm_free_disk_threshold" {
  type = number
}
variable "alarm_free_memory_threshold" {
  type = number
}
variable "alarm_cpu_credit_balance_threshold" {
  type = number
}
ariable "alarm_actions" {
  type = list
}
variable "ok_actions" {
  type = list
}
variable "insufficient_data_actions" {
  type = list
}