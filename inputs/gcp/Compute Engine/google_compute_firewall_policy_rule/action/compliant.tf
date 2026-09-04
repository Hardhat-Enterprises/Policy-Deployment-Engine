resource "google_compute_firewall_policy_rule" "compliant_example_1" {
  firewall_policy = "REPLACE_WITH_REAL_FIREWALL_POLICY_ID"
  priority        = 1000
  action          = "deny"
  direction       = "INGRESS"

  match {
    layer4_configs {
      ip_protocol = "tcp"
    }
  }
}
