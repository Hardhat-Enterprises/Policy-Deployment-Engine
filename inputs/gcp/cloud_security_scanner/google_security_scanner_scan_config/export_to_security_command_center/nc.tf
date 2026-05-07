resource "google_security_scanner_scan_config" "nc" {
  provider     = google-beta
  display_name = "non-compliant-security-scanner"

  starting_urls                     = ["https://example.com"]
  export_to_security_command_center = "DISABLED"
}
