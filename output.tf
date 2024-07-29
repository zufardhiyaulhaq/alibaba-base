output "vpc_name" {
  description = "VPC name"
  value       = alicloud_vpc.vpc.vpc_name
}

output "vpc_id" {
  description = "VPC id"
  value       = alicloud_vpc.vpc.id
}

output "private_dns_name" {
  description = "private DNS name"
  value       = alicloud_pvtz_zone.private_zone.zone_name
}

output "utility_subnet_ids" {
  description = "Utility subnet IDs"
  value       = values(alicloud_vswitch.utility_subnets).*.id
}

output "application_subnet_ids" {
  description = "Application subnet IDs"
  value       = values(alicloud_vswitch.application_subnets).*.id
}

output "stateful_subnet_ids" {
  description = "Stateful subnet IDs"
  value       = values(alicloud_vswitch.stateful_subnets).*.id
}

output "compliance_subnet_ids" {
  description = "Compliance subnet IDs"
  value       = values(alicloud_vswitch.compliance_subnets).*.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = values(alicloud_vswitch.public_subnets).*.id
}

output "utility_subnets_cidr" {
  description = "Utility subnet CIDR"
  value       = values(alicloud_vswitch.utility_subnets).*.cidr_block
}

output "application_subnets_cidr" {
  description = "Application subnet CIDR"
  value       = values(alicloud_vswitch.application_subnets).*.cidr_block
}

output "stateful_subnets_cidr" {
  description = "Stateful subnet CIDR"
  value       = values(alicloud_vswitch.stateful_subnets).*.cidr_block
}

output "compliance_subnets_cidr" {
  description = "Compliance subnet CIDR"
  value       = values(alicloud_vswitch.compliance_subnets).*.cidr_block
}

output "public_subnets_cidr" {
  description = "Public subnet CIDR"
  value       = values(alicloud_vswitch.public_subnets).*.cidr_block
}

output "nat_general_addresses" {
  description = "NAT general addresses"
  value       = values(alicloud_eip_address.general_nat_ip).*.ip_address
}

output "nat_application_addresses" {
  description = "NAT application addresses"
  value       = values(alicloud_eip_address.application_nat_ip).*.ip_address
}