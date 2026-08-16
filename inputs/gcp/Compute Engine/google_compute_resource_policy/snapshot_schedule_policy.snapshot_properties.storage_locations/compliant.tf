resource "google_compute_resource_policy" "compliant_example_1" {
  name   = "compliant-example-1"
  region = "us-central1"
  description = "chain name snapshot"

    snapshot_properties {
      storage_locations = ["au"]
    }
  }