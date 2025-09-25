resource "google_app_engine_firewall_rule" "allow_all" {
  project      = "nc"
  priority     = 1000
  action       = "ALLOW"
  source_range = "0.0.0.0/0"
  description  = "Allow all traffic (non-compliant)"
}
