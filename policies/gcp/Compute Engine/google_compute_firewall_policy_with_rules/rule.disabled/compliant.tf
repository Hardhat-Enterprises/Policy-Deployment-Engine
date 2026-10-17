resource "google_compute_firewall_policy_with_rules" "compliant_example_1" {
  short_name      = "example-firewall-policy"
  parent          = "organizations/123456789"
  deletion_policy = "PREVENT"

  rule {
    action    = "deny"
    direction = "INGRESS"
    priority  = 1000
    rule_name = "example-rule"
    disabled  = false

    match {
      src_ip_ranges = ["10.0.0.0/8"]

      layer4_config {
        ip_protocol = "tcp"
        ports       = ["443"]
      }
    }
  }
}