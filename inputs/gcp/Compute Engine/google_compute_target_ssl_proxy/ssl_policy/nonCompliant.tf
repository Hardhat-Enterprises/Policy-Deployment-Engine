resource "google_compute_target_ssl_proxy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  backend_service = "https://www.googleapis.com/compute/v1/projects/fake-project/global/backendServices/fake-backend-service"

  ssl_certificates = [
    "https://www.googleapis.com/compute/v1/projects/fake-project/global/sslCertificates/fake-certificate"
  ]
}
