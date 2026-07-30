resource "google_network_services_gateway" "noncompliant_example_1" {
  name     = "noncompliant-gateway"
  location = "us-central1"
  type     = "SECURE_WEB_GATEWAY"
}