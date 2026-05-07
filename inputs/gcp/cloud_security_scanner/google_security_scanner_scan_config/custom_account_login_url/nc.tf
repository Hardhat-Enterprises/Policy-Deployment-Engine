resource "google_security_scanner_scan_config" "nc" {
  provider     = google-beta
  display_name = "nc"

  starting_urls = ["https://example.com"]

  authentication {
    custom_account {
      username  = "scanner-user"
      password  = "scanner-password"
      login_url = "http://example.com/login"
    }
  }
}