resource "google_network_security_gateway_security_policy_rule" "non_compliant_example_1" {
  name                     = "non_compliant_example_1"
  location                 = "global"
  gateway_security_policy  = "example-policy"
  enabled                  = false
  priority                 = 1
  session_matcher          = "true"
  basic_profile            = "ALLOW"
}
