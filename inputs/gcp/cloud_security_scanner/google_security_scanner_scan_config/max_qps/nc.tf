resource "google_security_scanner_scan_config" "nc" {
  provider     = google-beta
  display_name = "non-compliant-security-scanner"

  starting_urls = ["https://example.com"]

  max_qps = 20
}