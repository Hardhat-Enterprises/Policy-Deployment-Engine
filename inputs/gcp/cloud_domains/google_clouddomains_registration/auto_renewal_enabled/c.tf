resource "google_clouddomains_registration" "c" {
  domain_name = "c"
  location    = "global"

  management_settings {
    renewal_method = "AUTOMATIC_RENEWAL"
  }
}
