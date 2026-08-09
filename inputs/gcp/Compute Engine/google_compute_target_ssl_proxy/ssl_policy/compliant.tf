resource "google_compute_target_ssl_proxy" "compliant_example_1" {
  name            = "compliant-example-1"
  backend_service = "https://www.googleapis.com/compute/v1/projects/fake-project/global/backendServices/fake-backend-service"

  ssl_certificates = [
    "https://www.googleapis.com/compute/v1/projects/fake-project/global/sslCertificates/fake-certificate"
  ]

  ssl_policy = "https://www.googleapis.com/compute/v1/projects/fake-project/global/sslPolicies/fake-ssl-policy"
}
