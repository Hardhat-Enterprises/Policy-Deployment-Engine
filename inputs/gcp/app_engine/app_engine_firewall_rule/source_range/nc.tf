resource "google_app_engine_firewall_rule" "nc" {
  project      = "ae-project"
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}