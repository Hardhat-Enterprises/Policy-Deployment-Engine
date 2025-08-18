# Public mailbox
resource "google_iap_brand" "brand_public_email" {
  project           = "my-project"
  support_email     = "support@gmail.com"       #public domain
  application_title = "Cloud IAP – Customer Portal"
}

# Non-corporate external domain
resource "google_iap_brand" "brand_external_domain" {
  project           = "my-project"
  support_email     = "help@vendor.io"          #not in allowed corp domain
  application_title = "Cloud IAP – Customer Portal"
}