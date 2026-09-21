resource "google_compute_region_network_firewall_policy_with_rules" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
    rule {
    priority       = 1000
    action         = "deny"
    direction      = "INGRESS"
    security_profile_group = "https://networksecurity.googleapis.com/v1/projects/example-security-project/locations/global/securityProfiles/standard-threat-prevention"
    match {
      src_ip_ranges            = ["0.0.0.0/0"]

      layer4_config {
        ip_protocol = "all"
      }
    }
  }
}
