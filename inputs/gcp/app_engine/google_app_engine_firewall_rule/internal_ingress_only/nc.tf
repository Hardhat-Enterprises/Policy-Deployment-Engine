

# This config doesn't set any firewall rules, allowing public access to App Engine

# Optional: an explicit allow-all rule
resource "google_app_engine_firewall_rule" "allow_all" {
  project       = "your-gcp-project-id"
  priority      = 1000
  action        = "ALLOW"
  source_range  = "0.0.0.0/0"
  description   = "Allow all traffic"
}

