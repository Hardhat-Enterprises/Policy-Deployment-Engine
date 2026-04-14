resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"

  contact_settings {
    privacy = "PUBLIC_CONTACT_DATA"
  }
}
