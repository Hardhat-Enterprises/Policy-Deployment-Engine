resource "google_compute_region_network_firewall_policy_with_rules" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
    rule {
    priority       = 1000
    action         = "deny"
    direction      = "INGRESS"

    match {
      src_ip_ranges = ["0.0.0.0/0"]
      layer4_config {
        ip_protocol = "tcp" 
        ports = ["0-65535"]
      }
    }
  }
}
