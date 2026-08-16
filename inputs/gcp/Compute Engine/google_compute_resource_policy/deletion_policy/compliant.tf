resource "google_compute_resource_policy" "compliant-example-1" {
  name   = "compliant-example-1"
  region = "us-central1"
  deletion_policy = "PREVENT"
}