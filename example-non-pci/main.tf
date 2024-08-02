module "alibaba_vpc" {
  source = "../"

  vpc_name = "app-vpc"
  vpc_cidr = "10.31.0.0/16"

  label_environment = "staging"
  label_team        = "coins"

  public_subnets = {
    "public-vm-a" = {
      cidr              = "10.31.78.0/24",
      availability_zone = "ap-southeast-5a",
    },
    "public-vm-b" = {
      cidr              = "10.31.79.0/24",
      availability_zone = "ap-southeast-5b",
    },
    "public-vm-c" = {
      cidr              = "10.31.80.0/24",
      availability_zone = "ap-southeast-5c",
    },
    "public-k8s-a" = {
      cidr              = "10.31.66.0/23",
      availability_zone = "ap-southeast-5a",
    },
    "public-k8s-b" = {
      cidr              = "10.31.68.0/23",
      availability_zone = "ap-southeast-5b",
    },
    "public-k8s-c" = {
      cidr              = "10.31.70.0/23",
      availability_zone = "ap-southeast-5c",
    },
  }
  utility_subnets = {}
  application_subnets = {
    "application-vm-a" = {
      cidr              = "10.31.72.0/24",
      availability_zone = "ap-southeast-5a",
    },
    "application-vm-b" = {
      cidr              = "10.31.73.0/24",
      availability_zone = "ap-southeast-5b",
    },
    "application-vm-c" = {
      cidr              = "10.31.74.0/24",
      availability_zone = "ap-southeast-5c",
    },
    "application-k8s-a" = {
      cidr              = "10.31.0.0/20",
      availability_zone = "ap-southeast-5a",
    },
    "application-k8s-b" = {
      cidr              = "10.31.16.0/20",
      availability_zone = "ap-southeast-5b",
    },
    "application-k8s-c" = {
      cidr              = "10.31.32.0/20",
      availability_zone = "ap-southeast-5c",
    },
  }
  stateful_subnets = {
    "stateful-vm-a" = {
      cidr              = "10.31.48.0/22",
      availability_zone = "ap-southeast-5a",
    },
    "stateful-vm-b" = {
      cidr              = "10.31.52.0/22",
      availability_zone = "ap-southeast-5b",
    },
    "stateful-vm-c" = {
      cidr              = "10.31.56.0/22",
      availability_zone = "ap-southeast-5c",
    },
  }
  compliance_subnets = {}

  general_nat_subnet_location     = "utility-vm-a"
  application_nat_subnet_location = "utility-vm-a"

  general_nat_ip = {
    "general-nat-ip-01" = {},
    "general-nat-ip-02" = {},
  }

  application_nat_ip = {
    "application-nat-ip-01" = {},
    "application-nat-ip-02" = {},
    "application-nat-ip-03" = {},
    "application-nat-ip-04" = {},
    "application-nat-ip-05" = {},
    "application-nat-ip-06" = {},
    "application-nat-ip-07" = {},
    "application-nat-ip-08" = {},
  }
}