module "network" {
  source = "git::ssh://git@github.com/carlosrv999/sample-module.git?ref=v1.0.1"

  network_name = "vpc-carlos"
  public_subnets = [
    "10.100.0.0/21",
    "10.100.8.0/21",
    "10.100.16.0/21"
  ]
  public_subnet_suffix = "public-project-carlos"
  region               = "us-central1"
}

resource "google_service_account" "default" {
  account_id   = "carlos-account"
  display_name = "Carlos Service Account"
}

resource "google_compute_firewall" "default" {
  name    = "ssh"
  network = module.network.network_name

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["38.25.18.114/32"]

  target_service_accounts = [
    google_service_account.default.email
  ]

}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n2-standard-2"
  zone         = "us-central1-c"

  boot_disk { #tfsec:ignore:google-compute-vm-disk-encryption-customer-key
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = module.network.network_name
    subnetwork = module.network.public_subnets_names[0]
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    block-project-ssh-keys = true
  }

  shielded_instance_config {
    enable_vtpm = true
  }
}
