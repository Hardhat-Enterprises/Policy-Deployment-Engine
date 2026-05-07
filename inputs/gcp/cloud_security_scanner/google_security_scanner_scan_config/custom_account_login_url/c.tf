resource "google_security_scanner_scan_config" "c" {
  provider     = google-beta
  display_name = "compliant-security-scanner"

  starting_urls = ["https://example.com"]

  authentication {
    custom_account {
      username  = "scanner-user"
      password  = "scanner-password"
      login_url = "https://example.com/login"
    }
  }
}