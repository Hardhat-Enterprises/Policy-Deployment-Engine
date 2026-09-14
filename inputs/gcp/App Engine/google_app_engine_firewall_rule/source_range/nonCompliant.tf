resource "google_app_engine_firewall_rule" "non_compliant_example_1" {
  project      = "ae-project"
  priority     = 1001
  action       = "ALLOW"
  source_range = "*"
}
