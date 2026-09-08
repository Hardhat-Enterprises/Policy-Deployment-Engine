resource "google_compute_region_disk" "non_compliant_example_1" {
  name    = "non-compliant-region-disk"
  project = "fake-project"
  region  = "us-east1"

  type = "pd-ssd"
  size = 200

  replica_zones = [
    "us-east1-b",
    "us-east1-c"
  ]
}