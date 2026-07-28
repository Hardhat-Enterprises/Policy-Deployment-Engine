resource "google_beyondcorp_security_gateway_application_iam_member" "compliant_example_1" {
  security_gateway_id = "compliant_example_1"
  application_id = "c"
  project = "smooth-verve-467716-v1"
  role = "roles/beyondcorp.securityGatewayUser"
  member = "user:jane@example.com"
}
