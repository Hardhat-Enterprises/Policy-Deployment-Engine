resource "google_compute_region_network_firewall_policy_with_rules" "compliant_example_1" {
  name          = "compliant_example_1"
    rule {
    priority       = 1000
    action         = "deny"
    direction      = "INGRESS"
    security_profile_group = "https://networksecurity.googleapis.com/v1/projects/APPROVED_SECURITY_PROJECT/locations/global/securityProfileGroups/standard-threat-prevention"
    match {
      src_ip_ranges            = ["0.0.0.0/0"]

      layer4_config {
        ip_protocol = "all"
      }
    }
  }
}
