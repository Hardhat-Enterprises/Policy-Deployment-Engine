resource "google_security_scanner_scan_config" "non_compliant_blacklist_patterns" {
  provider     = google-beta
  display_name = "nc"

  starting_urls      = ["https://example.com"]
  blacklist_patterns = []
}
