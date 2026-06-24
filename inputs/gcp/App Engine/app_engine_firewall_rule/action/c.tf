resource "google_app_engine_firewall_rule" "c" {
  project      = "gcp-project-12345"
  priority     = 1000
  action       = "ALLOW"
  source_range = "0.0.0.0/0"
}