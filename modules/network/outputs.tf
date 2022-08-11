output "network_id" {
  value = google_compute_network.vpc_network.id
}

output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "public_subnets_names" {
  value = google_compute_subnetwork.public[*].name
}
