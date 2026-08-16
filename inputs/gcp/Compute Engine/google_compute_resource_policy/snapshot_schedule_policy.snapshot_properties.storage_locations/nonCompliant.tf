resource "google_compute_resource_policy" "non_compliant_example_1" {
  name   = "non-compliant-example-1"
  region = "us-central1"
  description = "chain name snapshot"

    snapshot_properties {
      storage_locations = ["us"]
    }
  }