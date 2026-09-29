resource "google_compute_backend_bucket_signed_url_key" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  backend_bucket  = "example-backend-bucket"
  key_value       = "AAAAAAAAAAAAAAAAAAAAAA=="
  deletion_policy = "ABANDON"
}
