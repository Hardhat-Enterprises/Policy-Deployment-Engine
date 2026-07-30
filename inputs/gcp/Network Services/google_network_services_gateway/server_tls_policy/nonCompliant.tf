resource "google_network_services_gateway" "noncompliant_example_1" {
  name     = "noncompliant-gateway"
  location = "global"
  type     = "SECURE_WEB_GATEWAY"

  server_tls_policy = ""
}