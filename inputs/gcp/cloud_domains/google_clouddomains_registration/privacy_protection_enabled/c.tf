resource "google_clouddomains_registration" "c" {
  domain_name = "c"
  location    = "global"

  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
  }
}
