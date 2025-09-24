resource "google_app_engine_firewall_rule" "internal_only" {
  project  = "your-gcp-project-id"
  priority = 1000
  action   = "DENY"
  source_range = "0.0.0.0/0"
  description  = "Deny all external access"
}

resource "google_app_engine_firewall_rule" "internal_allow" {
  project  = "your-gcp-project-id"
  priority = 500
  action   = "ALLOW"
  source_range = "10.0.0.0/8" # Internal network range
  description  = "Allow internal access"
}
