resource "google_network_services_gateway" "compliant_example_1" {
  name     = "compliant-gateway"
  location = "global"
  type     = "SECURE_WEB_GATEWAY"

  server_tls_policy = "projects/example-project/locations/global/serverTlsPolicies/example-policy"
}