resource "google_security_scanner_scan_config" "nc" {
  provider         = google-beta
  display_name     = "non-compliant-security-scanner"
  starting_urls    = ["http://example.com"]
  target_platforms = ["COMPUTE"]
}