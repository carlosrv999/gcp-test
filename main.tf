module "network" {
  source = "git::https://github.com/carlosrv999/sample-module.git"

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

resource "google_compute_firewall" "vpc_emojiapp" {
  name    = "ssh"
  network = module.network.network_name

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_service_accounts = [
    google_service_account.default.email
  ]

}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-c"

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = module.network.network_name
    subnetwork = module.network.public_subnets_names[0]

    access_config {
      network_tier = "STANDARD"
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
