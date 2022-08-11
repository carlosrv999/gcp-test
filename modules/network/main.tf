resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet_1" {
  count = var.create_subnets ? 1 : 0
  name                     = "${var.network_name}-subnet-tf-1"
  ip_cidr_range            = var.subnet_1_ipv4_cidr_range
  network                  = google_compute_network.vpc_network.id
  description              = "subnet 1"
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
  region                   = var.region
}

resource "google_compute_subnetwork" "subnet_2" {
  count = var.create_subnets ? 1 : 0
  name                     = "${var.network_name}-subnet-tf-2"
  ip_cidr_range            = var.subnet_2_ipv4_cidr_range
  network                  = google_compute_network.vpc_network.id
  description              = "subnet 2"
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
  region                   = var.region
}

resource "google_compute_subnetwork" "subnet_3" {
  count = var.create_subnets ? 1 : 0
  name                     = "${var.network_name}-subnet-tf-3"
  ip_cidr_range            = var.subnet_3_ipv4_cidr_range
  network                  = google_compute_network.vpc_network.id
  description              = "subnet 3"
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
  region                   = var.region
}
