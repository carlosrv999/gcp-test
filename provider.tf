terraform {
  required_version = ">= 1.1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.31.0"
    }
  }
}

provider "google" {
  project = "agile-terra-359116"
  region  = "us-central1"
}
