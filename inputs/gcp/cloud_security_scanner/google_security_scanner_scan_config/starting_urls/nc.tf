resource "google_security_scanner_scan_config" "nc" {
  provider         = google-beta
  display_name     = "nc"
  starting_urls    = ["http://example.com"]
  target_platforms = ["COMPUTE"]
}