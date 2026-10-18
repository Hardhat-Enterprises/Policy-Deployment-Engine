resource "google_compute_firewall_policy_rule" "compliant_example_1" {
  firewall_policy         = "REPLACE_WITH_REAL_FIREWALL_POLICY_ID"
  priority                = 1000
  action                  = "apply_security_profile_group"
  direction                = "INGRESS"
  security_profile_group  = "https://networksecurity.googleapis.com/v1/projects/PDE/locations/global/securityProfileGroups/example"
  tls_inspect              = true

  match {
    layer4_configs {
      ip_protocol = "tcp"
    }
  }
}
