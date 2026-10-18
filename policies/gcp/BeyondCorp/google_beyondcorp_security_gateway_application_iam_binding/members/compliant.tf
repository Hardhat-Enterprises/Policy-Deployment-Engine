resource "google_beyondcorp_security_gateway_application_iam_binding" "compliant_example_1" {
  security_gateway_id = "compliant_example_1"
  project = "smooth-verve-467716-v1"
  application_id = "c"
  role = "roles/beyondcorp.securityGatewayUser"
  members = [
    "user:jane@example.com"
  ]
}
