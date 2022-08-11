resource "google_compute_subnetwork" "subnet_emojiapp_1" {
  name                     = "subnet-emojiapp-1"
  ip_cidr_range            = "10.100.0.0/21"
  network                  = module.network.network_id
  description              = "subnet 1 for emojiapp"
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
}
