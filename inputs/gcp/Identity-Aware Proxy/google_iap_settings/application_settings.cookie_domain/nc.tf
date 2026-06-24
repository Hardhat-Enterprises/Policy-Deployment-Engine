# Public domain
resource "google_iap_settings" "nc1" {
  name = "nc1"
  application_settings { cookie_domain = "gmail.com" }   #  public
}

# External vendor domain
resource "google_iap_settings" "nc2" {
  name = "nc2"
  application_settings { cookie_domain = "vendor.io" }   #  external
}

# Trailing space (formatting error)
resource "google_iap_settings" "nc3" {
  name = "nc3"
  application_settings { cookie_domain = "example.com " } #  sloppy
}
