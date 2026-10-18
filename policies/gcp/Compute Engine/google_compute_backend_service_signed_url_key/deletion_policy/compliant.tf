# Compliant example for google_compute_backend_service_signed_url_key.
# deletion_policy is set to PREVENT to protect the signed URL key
# from accidental deletion through Terraform.

resource "google_compute_backend_service_signed_url_key" "compliant_example_1" {
  name = "compliant-example-1"
  key_value       = "AAAAAAAAAAAAAAAAAAAAAA=="
  backend_service = "example-backend-service"
  deletion_policy = "PREVENT"
}