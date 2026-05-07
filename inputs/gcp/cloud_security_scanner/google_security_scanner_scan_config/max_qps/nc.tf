resource "google_security_scanner_scan_config" "nc" {
  provider     = google-beta
  display_name = "nc"

  starting_urls = ["https://example.com"]

  max_qps = 20
}