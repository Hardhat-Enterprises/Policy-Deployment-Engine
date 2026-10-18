resource "google_compute_network_firewall_policy_with_rules" "non_compliant_example_1" {
  name            = "example-firewall-policy"
  project         = "pde-test-project-01"
  deletion_policy = "PREVENT"

  rule {
    action                 = "apply_security_profile_group"
    priority               = 1000
    rule_name              = "example-rule"
    disabled               = false
    enable_logging         = true
    security_profile_group = ""

    match {
      layer4_config {
        ip_protocol = "tcp"
        ports       = ["443"]
      }
    }
  }
}