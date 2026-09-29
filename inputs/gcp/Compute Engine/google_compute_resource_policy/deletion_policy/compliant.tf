resource "google_compute_resource_policy" "compliant_example_1" {
  name   = "compliant-example-1"
  region = "us-central1"
  deletion_policy = "PREVENT"
}
resource "google_compute_resource_policy" "compliant_example_2" {
  name   = "compliant-example-2"
  region = "us-central1"
  deletion_policy = "ABANDON"
}