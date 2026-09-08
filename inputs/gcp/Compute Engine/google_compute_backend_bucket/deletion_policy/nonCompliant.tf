resource "google_compute_backend_bucket" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  bucket_name     = "non-compliant-example-bucket"
  deletion_policy = "DELETE"
}