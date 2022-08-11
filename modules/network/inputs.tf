variable "network_name" {
  type = string
  description = "Name of the network"
}

variable "subnet_1_ipv4_cidr_range" {
  type = string
  description = "CIDR range for subnet 1"
  default = "10.100.0.0/24"
}

variable "subnet_2_ipv4_cidr_range" {
  type = string
  description = "CIDR range for subnet 2"
  default = "10.100.1.0/24"
}

variable "subnet_3_ipv4_cidr_range" {
  type = string
  description = "CIDR range for subnet 3"
  default = "10.100.2.0/24"
}

variable "region" {
  type = string
  description = "region to deploy subnets"
}

variable "create_subnets" {
  type = bool
  description = "should we create subnets or not"
  default = false
}
