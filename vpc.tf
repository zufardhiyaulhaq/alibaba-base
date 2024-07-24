resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_route_table" "application" {
  description      = "application route table"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "application"
  associate_type   = "VSwitch"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_vswitch" "application_subnets" {
  for_each = var.application_subnets

  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = each.value.cidr

  zone_id      = each.value.availability_zone
  vswitch_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_route_table_attachment" "application" {
  for_each       = alicloud_vswitch.application_subnets
  vswitch_id     = each.value.id
  route_table_id = alicloud_route_table.application.id
}

resource "alicloud_route_table" "utility" {
  description      = "utility route table"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "utility"
  associate_type   = "VSwitch"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_vswitch" "utility_subnets" {
  for_each = var.utility_subnets

  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = each.value.cidr

  zone_id      = each.value.availability_zone
  vswitch_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_route_table_attachment" "utility" {
  for_each       = alicloud_vswitch.utility_subnets
  vswitch_id     = each.value.id
  route_table_id = alicloud_route_table.utility.id
}

resource "alicloud_route_table" "public" {
  description      = "public route table"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "public"
  associate_type   = "VSwitch"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_vswitch" "public_subnets" {
  for_each = var.public_subnets

  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = each.value.cidr

  zone_id      = each.value.availability_zone
  vswitch_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_route_table_attachment" "public" {
  for_each       = alicloud_vswitch.public_subnets
  vswitch_id     = each.value.id
  route_table_id = alicloud_route_table.public.id
}

resource "alicloud_route_table" "stateful" {
  description      = "stateful route table"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "stateful"
  associate_type   = "VSwitch"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_vswitch" "stateful_subnets" {
  for_each = var.stateful_subnets

  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = each.value.cidr

  zone_id      = each.value.availability_zone
  vswitch_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_route_table_attachment" "stateful" {
  for_each       = alicloud_vswitch.stateful_subnets
  vswitch_id     = each.value.id
  route_table_id = alicloud_route_table.stateful.id
}

resource "alicloud_route_table" "compliance" {
  description      = "compliance route table"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "compliance"
  associate_type   = "VSwitch"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_vswitch" "compliance_subnets" {
  for_each = var.compliance_subnets

  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = each.value.cidr

  zone_id      = each.value.availability_zone
  vswitch_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_route_table_attachment" "compliance" {
  for_each       = alicloud_vswitch.compliance_subnets
  vswitch_id     = each.value.id
  route_table_id = alicloud_route_table.compliance.id
}

resource "alicloud_eip_address" "general_nat_ip" {
  for_each = var.general_nat_ip

  address_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

data "alicloud_vswitches" "vswitch_general_nat" {
  name_regex = var.general_nat_subnet_location
  depends_on = [
    alicloud_vswitch.application_subnets,
    alicloud_vswitch.compliance_subnets,
    alicloud_vswitch.public_subnets,
    alicloud_vswitch.stateful_subnets,
    alicloud_vswitch.utility_subnets,
  ]
}

resource "alicloud_nat_gateway" "general_nat" {
  vpc_id           = alicloud_vpc.vpc.id
  nat_gateway_name = "general-nat"
  nat_type         = "Enhanced"

  vswitch_id = data.alicloud_vswitches.vswitch_general_nat.vswitches.0.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_eip_association" "general_nat_ip_association" {
  for_each = alicloud_eip_address.general_nat_ip

  allocation_id = each.value.id
  instance_id   = alicloud_nat_gateway.general_nat.id
}

resource "alicloud_snat_entry" "general_snat_entry" {
  snat_table_id = alicloud_nat_gateway.general_nat.snat_table_ids
  source_cidr   = "0.0.0.0/0"
  snat_ip       = join(",", values(alicloud_eip_address.general_nat_ip).*.ip_address)
}

resource "alicloud_eip_address" "application_nat_ip" {
  for_each = var.application_nat_ip

  address_name = each.key

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

data "alicloud_vswitches" "vswitch_application_nat" {
  name_regex = var.application_nat_subnet_location
  depends_on = [
    alicloud_vswitch.application_subnets,
    alicloud_vswitch.compliance_subnets,
    alicloud_vswitch.public_subnets,
    alicloud_vswitch.stateful_subnets,
    alicloud_vswitch.utility_subnets,
  ]
}

resource "alicloud_nat_gateway" "application_nat" {
  vpc_id           = alicloud_vpc.vpc.id
  nat_gateway_name = "application-nat"
  nat_type         = "Enhanced"

  vswitch_id = data.alicloud_vswitches.vswitch_application_nat.vswitches.0.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_eip_association" "application_nat_ip_association" {
  for_each = alicloud_eip_address.application_nat_ip

  allocation_id = each.value.id
  instance_id   = alicloud_nat_gateway.application_nat.id
}

resource "alicloud_snat_entry" "application_snat_entry" {
  snat_table_id = alicloud_nat_gateway.application_nat.snat_table_ids
  source_cidr   = "0.0.0.0/0"
  snat_ip       = join(",", values(alicloud_eip_address.application_nat_ip).*.ip_address)
}

resource "alicloud_pvtz_zone" "private_zone" {
  zone_name = "${var.vpc_name}.internal.io"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_pvtz_zone_attachment" "zone_attachment" {
  zone_id = alicloud_pvtz_zone.private_zone.id
  vpc_ids = [alicloud_vpc.vpc.id]
}