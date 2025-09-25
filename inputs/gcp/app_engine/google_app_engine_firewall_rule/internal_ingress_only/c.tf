resource "google_app_engine_firewall_rule" "internal_allow" {
  project      = "c"
  priority     = 1000
  action       = "ALLOW"
  source_range = "10.0.0.0/8"
  description  = "Allow internal access only"
}
