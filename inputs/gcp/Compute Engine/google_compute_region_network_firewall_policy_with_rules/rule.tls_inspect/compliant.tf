resource "google_compute_region_network_firewall_policy_with_rules" "compliant_example_1" {
  name          = "compliant_example_1"
    rule {
    priority       = 1000
    action         = "deny"
    direction      = "INGRESS"
    tls_inspect = TRUE

    match {
      src_ip_ranges            = ["0.0.0.0/0"]

      layer4_config {
        ip_protocol = "all"
      }
    }
  }
}
