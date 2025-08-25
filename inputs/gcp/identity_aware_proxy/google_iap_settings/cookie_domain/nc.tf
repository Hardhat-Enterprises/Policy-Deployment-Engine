# Public domain
resource "google_iap_settings" "nc_public" {
  name = "projects/123456789/iap_web"
  application_settings { cookie_domain = "gmail.com" }   #  public
}

# External vendor domain
resource "google_iap_settings" "nc_vendor" {
  name = "projects/123456789/iap_web"
  application_settings { cookie_domain = "vendor.io" }   #  external
}

# Trailing space (formatting error)
resource "google_iap_settings" "nc_trailing_space" {
  name = "projects/123456789/iap_web"
  application_settings { cookie_domain = "example.com " } #  sloppy
}
