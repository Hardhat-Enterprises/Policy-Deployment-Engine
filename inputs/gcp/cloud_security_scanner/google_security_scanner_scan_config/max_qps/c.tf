resource "google_security_scanner_scan_config" "c" {
  provider         = google-beta
  display_name     = "c"
  starting_urls    = ["https://example.com"]
  target_platforms = ["COMPUTE"]

  max_qps = 10
}