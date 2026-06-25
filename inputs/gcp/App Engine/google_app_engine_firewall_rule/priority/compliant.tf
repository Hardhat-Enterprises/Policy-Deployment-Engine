resource "google_app_engine_firewall_rule" "compliant_example_1" {
  project      = "gcp-project-12345"
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}
