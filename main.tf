module "network" {
  source = "./modules/network"

  network_name = "vpc-carlos"
  subnet_1_ipv4_cidr_range = "10.100.0.0/21"
  subnet_2_ipv4_cidr_range = "10.100.8.0/21"
  subnet_3_ipv4_cidr_range = "10.100.16.0/21"
  region = "us-central1"
}
