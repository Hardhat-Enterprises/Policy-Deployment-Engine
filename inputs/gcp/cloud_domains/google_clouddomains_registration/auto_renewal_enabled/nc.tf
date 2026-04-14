resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"

  management_settings {
    renewal_method = "MANUAL_RENEWAL"
  }
}
