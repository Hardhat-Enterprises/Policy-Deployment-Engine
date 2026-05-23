resource "google_security_scanner_scan_config" "nc" {
  provider         = google-beta
  display_name     = "nc"
  starting_urls    = ["https://example.com"]
  target_platforms = ["COMPUTE"]

  export_to_security_command_center = "DISABLED"
}