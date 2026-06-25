resource "google_beyondcorp_security_gateway_iam_binding" "compliant_example_1" {
  project = "smooth-verve-467716-v1"
  security_gateway_id = "compliant_example_1"
  role = "roles/beyondcorp.securityGatewayUser"
  members = [
    "user:jane@example.com",
  ]
}
