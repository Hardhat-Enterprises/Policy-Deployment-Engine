resource "google_compute_firewall_policy_with_rules" "non_compliant_example_1" {
  short_name      = "example-firewall-policy"
  parent          = "organizations/123456789"
  deletion_policy = "PREVENT"

  rule {
    action         = "allow"
    direction      = "INGRESS"
    priority       = 1000
    rule_name      = "example-rule"
    disabled       = false
    enable_logging = true

    match {
      src_ip_ranges = ["10.0.0.0/8"]

      layer4_config {
        ip_protocol = "tcp"
        ports       = ["0-65535"]
      }
    }
  }
}