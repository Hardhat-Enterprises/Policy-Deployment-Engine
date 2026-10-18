resource "google_network_services_authz_extension" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  location = "us-central1"
  service  = "iap.googleapis.com"
  timeout  = "0.1s"
}