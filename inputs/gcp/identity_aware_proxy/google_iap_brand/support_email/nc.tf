# Public mailbox
resource "google_iap_brand" "nc1" {
  project           = "nc1"
  support_email     = "support@gmail.com"             #  public
  application_title = "Cloud IAP – Customer Portal"
}

# External vendor domain
resource "google_iap_brand" "nc2" {
  project           = "nc2"
  support_email     = "help@vendor.io"                #  external
  application_title = "Cloud IAP – Customer Portal"
}

# Trailing space
resource "google_iap_brand" "nc3" {
  project           = "nc3"
  support_email     = "support@example.com "          #  space
  application_title = "Cloud IAP – Customer Portal"
}
