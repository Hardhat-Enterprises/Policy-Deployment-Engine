resource "google_compute_region_network_firewall_policy_with_rules" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
    rule {
    priority       = 1000
    action         = "deny"
    direction      = "EGRESS"

    match {
      dest_ip_ranges            = ["0.0.0.0/0"]
      dest_region_codes         = ["HK", "IN"]
      layer4_config {
        ip_protocol = "all"
      }
    }
  }
}
