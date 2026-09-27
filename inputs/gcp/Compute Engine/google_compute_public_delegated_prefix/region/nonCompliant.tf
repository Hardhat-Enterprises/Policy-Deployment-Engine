resource "google_compute_public_delegated_prefix" "non_compliant_example_1" {
  name    = "non-compliant-region-disk"
  project = "fake-project"
  region  = "us-east1"

  parent_prefix = "projects/fake-project/global/publicAdvertisedPrefixes/example-parent"
  ip_cidr_range = "192.0.2.0/24"
}