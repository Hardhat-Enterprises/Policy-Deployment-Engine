resource "google_iap_settings" "c_settings" {
  # Use any project number for planning; format must be projects/<NUMBER>/iap_web
  name = "projects/123456789/iap_web"

  application_settings {
    cookie_domain = "example.com"   #  corporate domain
  }
}
