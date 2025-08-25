# Public mailbox
resource "google_iap_brand" "nc_public_email" {
  project           = "my-project"
  support_email     = "support@gmail.com"             #  public
  application_title = "Cloud IAP – Customer Portal"
}

# External vendor domain
resource "google_iap_brand" "nc_vendor_email" {
  project           = "my-project"
  support_email     = "help@vendor.io"                #  external
  application_title = "Cloud IAP – Customer Portal"
}

# Trailing space
resource "google_iap_brand" "nc_trailing_space_email" {
  project           = "my-project"
  support_email     = "support@example.com "          #  space
  application_title = "Cloud IAP – Customer Portal"
}
