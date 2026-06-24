resource "google_app_engine_firewall_rule" "non_compliant_example_1" {
  project      = "gcp-project-12345"
  priority     = 2147483647
  action       = "ALLOW"
  source_range = "*"
}
