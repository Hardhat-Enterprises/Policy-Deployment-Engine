resource "google_iap_brand" "nc_title_test" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = "Test"                           #  too generic
}

resource "google_iap_brand" "nc_title_demo" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = "Demo"                           #  testy
}

resource "google_iap_brand" "nc_title_generic" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = "My Application"                 #  generic
}

resource "google_iap_brand" "nc_title_trailing_space" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = "Cloud IAP – Customer Portal "   #  trailing space
}
