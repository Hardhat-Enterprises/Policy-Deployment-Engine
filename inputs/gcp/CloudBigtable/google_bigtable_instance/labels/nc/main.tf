
terraform {
  required_providers {
    google = { source = "hashicorp/google", version = "~> 5.40" }
  }
}
provider "google" {
  project = var.project
  region  = var.region
}
variable "project" {}
variable "region"  { default = "australia-southeast1" }

resource "google_bigtable_instance" "bad" {
  name          = "pde-bad-instance"
  display_name  = "PDE BAD"
  instance_type = "DEVELOPMENT"

  cluster {
    cluster_id   = "pde-bad-cluster"
    zone         = "${var.region}-b"
    num_nodes    = 1
    storage_type = "SSD"
  }

  # Wrong/missing labels to trigger failures
  labels = {
    k1 = "WRONG"  # should be v1
    k2 = "v2"
    # omit many keys...
  }
}
