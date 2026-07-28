resource "google_app_engine_firewall_rule" "non_compliant_example_1" {
  project      = "ae-project"
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}
