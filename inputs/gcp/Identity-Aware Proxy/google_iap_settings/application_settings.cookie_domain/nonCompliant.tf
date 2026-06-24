# Public domain
resource "google_iap_settings" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  application_settings { cookie_domain = "gmail.com" }   #  public
}

# External vendor domain
resource "google_iap_settings" "non_compliant_example_2" {
  name = "non_compliant_example_2"
  application_settings { cookie_domain = "vendor.io" }   #  external
}

# Trailing space (formatting error)
resource "google_iap_settings" "non_compliant_example_3" {
  name = "non_compliant_example_3"
  application_settings { cookie_domain = "example.com " } #  sloppy
}
