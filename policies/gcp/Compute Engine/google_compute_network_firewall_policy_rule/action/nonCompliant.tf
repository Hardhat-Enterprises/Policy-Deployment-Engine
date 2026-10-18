resource "google_compute_network_firewall_policy_rule" "non_compliant_example_1" {
  action          = "allow"
  direction       = "INGRESS"
  firewall_policy = "fake-policy-id"
  priority        = 1000

  match {
    layer4_configs {
      ip_protocol = "tcp"
    }
  }
}