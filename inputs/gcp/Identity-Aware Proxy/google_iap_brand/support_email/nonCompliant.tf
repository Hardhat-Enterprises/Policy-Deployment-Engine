# Public mailbox
resource "google_iap_brand" "non_compliant_example_1" {
  project           = "non_compliant_example_1"
  support_email     = "support@gmail.com"             #  public
  application_title = "Cloud IAP – Customer Portal"
}

# External vendor domain
resource "google_iap_brand" "non_compliant_example_2" {
  project           = "non_compliant_example_2"
  support_email     = "help@vendor.io"                #  external
  application_title = "Cloud IAP – Customer Portal"
}

# Trailing space
resource "google_iap_brand" "non_compliant_example_3" {
  project           = "non_compliant_example_3"
  support_email     = "support@example.com "          #  space
  application_title = "Cloud IAP – Customer Portal"
}
