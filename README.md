## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | 1.220.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.220.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_eip_address.application_nat_ip](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/eip_address) | resource |
| [alicloud_eip_address.general_nat_ip](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/eip_address) | resource |
| [alicloud_eip_association.application_nat_ip_association](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/eip_association) | resource |
| [alicloud_eip_association.general_nat_ip_association](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/eip_association) | resource |
| [alicloud_nat_gateway.application_nat](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/nat_gateway) | resource |
| [alicloud_nat_gateway.general_nat](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/nat_gateway) | resource |
| [alicloud_pvtz_zone.private_zone](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/pvtz_zone) | resource |
| [alicloud_pvtz_zone_attachment.zone_attachment](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/pvtz_zone_attachment) | resource |
| [alicloud_route_table.application](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table) | resource |
| [alicloud_route_table.compliance](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table) | resource |
| [alicloud_route_table.public](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table) | resource |
| [alicloud_route_table.stateful](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table) | resource |
| [alicloud_route_table.utility](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table) | resource |
| [alicloud_route_table_attachment.application](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table_attachment) | resource |
| [alicloud_route_table_attachment.compliance](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table_attachment) | resource |
| [alicloud_route_table_attachment.public](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table_attachment) | resource |
| [alicloud_route_table_attachment.stateful](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table_attachment) | resource |
| [alicloud_route_table_attachment.utility](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/route_table_attachment) | resource |
| [alicloud_snat_entry.application_snat_entry](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/snat_entry) | resource |
| [alicloud_snat_entry.general_snat_entry](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/snat_entry) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/vpc) | resource |
| [alicloud_vswitch.application_subnets](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/vswitch) | resource |
| [alicloud_vswitch.compliance_subnets](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/vswitch) | resource |
| [alicloud_vswitch.public_subnets](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/vswitch) | resource |
| [alicloud_vswitch.stateful_subnets](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/vswitch) | resource |
| [alicloud_vswitch.utility_subnets](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/resources/vswitch) | resource |
| [alicloud_vswitches.vswitch_application_nat](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.vswitch_general_nat](https://registry.terraform.io/providers/aliyun/alicloud/1.220.1/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_nat_ip"></a> [application\_nat\_ip](#input\_application\_nat\_ip) | application NAT IPs | <pre>map(object({<br>  }))</pre> | n/a | yes |
| <a name="input_application_nat_subnet_location"></a> [application\_nat\_subnet\_location](#input\_application\_nat\_subnet\_location) | Application NAT subnet location | `string` | n/a | yes |
| <a name="input_application_subnets"></a> [application\_subnets](#input\_application\_subnets) | List of application subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_compliance_subnets"></a> [compliance\_subnets](#input\_compliance\_subnets) | List of compliance subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_general_nat_ip"></a> [general\_nat\_ip](#input\_general\_nat\_ip) | general NAT IPs | <pre>map(object({<br>  }))</pre> | n/a | yes |
| <a name="input_general_nat_subnet_location"></a> [general\_nat\_subnet\_location](#input\_general\_nat\_subnet\_location) | General NAT subnet location | `string` | n/a | yes |
| <a name="input_label_environment"></a> [label\_environment](#input\_label\_environment) | Enviroment label | `string` | n/a | yes |
| <a name="input_label_team"></a> [label\_team](#input\_label\_team) | Team label | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_stateful_subnets"></a> [stateful\_subnets](#input\_stateful\_subnets) | List of stateful subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_utility_subnets"></a> [utility\_subnets](#input\_utility\_subnets) | List of utility subnets | <pre>map(object({<br>    cidr              = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
