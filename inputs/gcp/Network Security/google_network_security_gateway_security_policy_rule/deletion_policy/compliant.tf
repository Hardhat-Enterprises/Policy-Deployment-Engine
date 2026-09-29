resource "google_network_security_gateway_security_policy_rule" "compliant_example_1" {
  name                     = "compliant_example_1"
  location                 = "global"
  gateway_security_policy  = "example-policy"
  enabled                  = true
  priority                 = 1
  session_matcher          = "true"
  basic_profile            = "ALLOW"
  deletion_policy          = "PREVENT"
}
