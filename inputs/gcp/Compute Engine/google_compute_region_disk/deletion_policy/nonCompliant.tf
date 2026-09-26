resource "google_compute_region_disk" "non_compliant_example_1" {
  name    = "non-compliant-disk-1"
  project = "fake-project"
  region  = "us-central1"

  type = "pd-ssd"
  size = 200

  replica_zones = [
    "us-central1-a",
    "us-central1-f"
  ]

  deletion_policy = "DELETE"
}