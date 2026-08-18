resource "google_beyondcorp_security_gateway_application_iam_member" "non_compliant_example_1" {
  security_gateway_id = "non_compliant_example_1"
  application_id = "nc"
  project = "smooth-verve-467716-v1"
  role = "roles/beyondcorp.securityGatewayUser"
  member = "allUsers"
}
