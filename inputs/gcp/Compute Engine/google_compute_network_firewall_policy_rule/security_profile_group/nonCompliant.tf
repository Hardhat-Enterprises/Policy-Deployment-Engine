resource "google_compute_network_firewall_policy_rule" "non_compliant_example_1" {
  action = "apply_security_profile_group"
  direction       = "INGRESS"
  firewall_policy = "fake-policy-id"
  priority        = 1000
  security_profile_group = "https://networksecurity.googleapis.com/v1/projects/fake-project/locations/global/securityProfileGroups/unapproved-spg"
  match {
    layer4_configs {
      ip_protocol = "tcp"
    }
  }
}