resource "google_compute_region_network_firewall_policy_with_rules" "compliant_example_1" {
  name            = "compliant-example-1"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"

  rule {
    priority       = 1000
    action         = "deny"
    direction      = "INGRESS"
    disabled       = false
    enable_logging = true

    match {
      src_ip_ranges = ["10.0.0.0/8"]
      layer4_config {
        ip_protocol = "tcp"
        ports       = ["443"]
      }
    }
  }
}