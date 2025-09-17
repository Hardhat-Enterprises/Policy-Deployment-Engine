resource "google_iap_brand" "nc1" {
  project           = "nc1"
  support_email     = "support@example.com"
  application_title = "Test"                           #  too generic
}

resource "google_iap_brand" "nc2" {
  project           = "nc2"
  support_email     = "support@example.com"
  application_title = "Demo"                           #  testy
}

resource "google_iap_brand" "nc3" {
  project           = "nc3"
  support_email     = "support@example.com"
  application_title = "My Application"                 #  generic
}

resource "google_iap_brand" "nc4" {
  project           = "nc4"
  support_email     = "support@example.com"
  application_title = "Cloud IAP – Customer Portal "   #  trailing space
}
