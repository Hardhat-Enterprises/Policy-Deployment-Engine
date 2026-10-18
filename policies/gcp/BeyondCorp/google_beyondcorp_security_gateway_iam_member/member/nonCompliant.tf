resource "google_beyondcorp_security_gateway_iam_member" "non_compliant_example_1" {
  project = "smooth-verve-467716-v1"
  security_gateway_id = "non_compliant_example_1"
  role = "roles/beyondcorp.securityGatewayUser"
  member = "allUsers"
}
