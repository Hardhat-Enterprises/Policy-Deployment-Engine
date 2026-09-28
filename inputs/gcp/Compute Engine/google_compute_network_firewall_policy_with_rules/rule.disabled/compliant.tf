resource "google_compute_network_firewall_policy_with_rules" "compliant_example_1" {
  name            = "example-firewall-policy"
  project         = "pde-test-project-01"
  deletion_policy = "PREVENT"

  rule {
    action    = "deny"
    priority  = 1000
    rule_name = "example-rule"
    disabled  = false

    match {
      layer4_config {
        ip_protocol = "tcp"
        ports       = ["443"]
      }
    }
  }
}