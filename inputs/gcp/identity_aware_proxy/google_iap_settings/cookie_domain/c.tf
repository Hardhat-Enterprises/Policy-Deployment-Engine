resource "google_iap_settings" "c" {
  # Use any project number for planning; format must be projects/<NUMBER>/iap_web
  name = "c"

  application_settings {
    cookie_domain = "example.com"   #  corporate domain
  }
}
