# Non-compliant example for google_compute_backend_service_signed_url_key.
# deletion_policy is set to DELETE, allowing Terraform to destroy
# the signed URL key.

resource "google_compute_backend_service_signed_url_key" "non_compliant_example_1" {
  name            = "example-signed-url-key"
  key_value       = "AAAAAAAAAAAAAAAAAAAAAA=="
  backend_service = "example-backend-service"
  deletion_policy = "ABANDON"
}