resource "google_compute_public_delegated_prefix" "compliant_example_1" {
  name    = "compliant-disk-1"
  project = "fake-project"
  region  = "us-central1"

  parent_prefix = "projects/fake-project/global/publicAdvertisedPrefixes/example-parent"
  ip_cidr_range = "192.0.2.0/24"

  deletion_policy = "PREVENT"
}