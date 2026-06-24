resource "google_iap_settings" "compliant_example_1" {
  # Use any project number for planning; format must be projects/<NUMBER>/iap_web
  name = "compliant_example_1"

  application_settings {
    cookie_domain = "example.com"   #  corporate domain
  }
}
