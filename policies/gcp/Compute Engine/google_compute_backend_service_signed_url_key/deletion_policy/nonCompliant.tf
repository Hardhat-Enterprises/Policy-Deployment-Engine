resource "google_compute_backend_service_signed_url_key" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  key_value       = "AAAAAAAAAAAAAAAAAAAAAA=="
  backend_service = "example-backend-service"
  deletion_policy = "DELETE"
}