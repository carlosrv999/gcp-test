resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "public" {
  count                    = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  name                     = format("subnet-${var.public_subnet_suffix}-%v", count.index)
  ip_cidr_range            = element(concat(var.public_subnets, [""]), count.index)
  network                  = google_compute_network.vpc_network.id
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
  region                   = var.region
}
