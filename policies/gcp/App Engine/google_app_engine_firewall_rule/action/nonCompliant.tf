resource "google_app_engine_firewall_rule" "non_compliant_example_1" {
  project      = "gcp-project-12345"
  priority     = 1000
  action       = "DENY"
  source_range = "0.0.0.0/0"
}
