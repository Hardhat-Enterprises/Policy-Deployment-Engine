resource "google_compute_backend_bucket" "compliant_example_1" {
  name            = "compliant-example-1"
  bucket_name     = "compliant-example-bucket"
  deletion_policy = "PREVENT"
}