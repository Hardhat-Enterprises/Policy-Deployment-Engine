resource "google_compute_region_disk" "compliant_example_1" {
  name    = "compliant-disk-1"
  project = "fake-project"
  region  = "us-central1"

  type = "pd-ssd"
  size = 200

  replica_zones = [
    "us-central1-a",
    "us-central1-f"
  ]

  deletion_policy = "PREVENT"
}