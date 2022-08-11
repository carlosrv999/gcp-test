variable "network_name" {
  type = string
  description = "Name of the network"
}

variable "subnet_1_ipv4_cidr_range" {
  type = string
  description = "CIDR range for subnet 1"
}

variable "subnet_2_ipv4_cidr_range" {
  type = string
  description = "CIDR range for subnet 2"
}

variable "subnet_3_ipv4_cidr_range" {
  type = string
  description = "CIDR range for subnet 3"
}

variable "region" {
  type = string
  description = "region to deploy subnets"
}
