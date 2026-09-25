resource "google_compute_region_network_firewall_policy_rule" "compliant_example_1" {
  rule_name       = "compliant_example_1"
  action          = "allow"
  direction       = "INGRESS"
  firewall_policy = "fw-policy"
  priority        = 1000
  region          = "australia-southeast1"

  match {
    src_ip_ranges        = ["10.0.0.0/8"]
    src_network_context  = "INTRA_VPC"

    layer4_configs {
      ip_protocol = "tcp"
    }
  }
}
