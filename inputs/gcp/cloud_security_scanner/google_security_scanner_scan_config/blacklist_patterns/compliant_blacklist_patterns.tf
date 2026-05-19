resource "google_security_scanner_scan_config" "compliant_blacklist_patterns" {
  provider     = google-beta
  display_name = "compliant-security-scanner"

  starting_urls = ["https://example.com"]

  blacklist_patterns = [
    "https://example.com/admin/*",
    "https://example.com/logout",
    "https://example.com/delete/*"
  ]
}