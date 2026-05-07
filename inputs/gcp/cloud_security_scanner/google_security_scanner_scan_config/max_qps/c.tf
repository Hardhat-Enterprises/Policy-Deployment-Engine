resource "google_security_scanner_scan_config" "c" {
  provider     = google-beta
  display_name = "compliant-security-scanner"

  starting_urls = ["https://example.com"]
  max_qps       = 10
}
