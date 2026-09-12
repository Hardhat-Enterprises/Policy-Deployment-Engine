resource "google_compute_firewall_policy_with_rules" "non_compliant_example_1" {
  short_name      = "example-firewall-policy"
  parent          = "organizations/123456789"
  deletion_policy = "DELETE"

  rule {
    action    = "deny"
    direction = "INGRESS"
    priority  = 1000
    rule_name = "example-rule"

    match {
      src_ip_ranges = ["10.0.0.0/8"]

      layer4_config {
        ip_protocol = "tcp"
        ports       = ["443"]
      }
    }
  }
}