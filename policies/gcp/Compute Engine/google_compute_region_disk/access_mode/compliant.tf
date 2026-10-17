resource "google_compute_region_disk" "compliant_example_1" {
  name    = "compliant-access-mode-disk"
  project = "fake-project"
  region  = "us-central1"

  type = "hyperdisk-balanced-high-availability"
  size = 200

  replica_zones = [
    "us-central1-a",
    "us-central1-f"
  ]

  access_mode = "READ_WRITE_SINGLE"
}