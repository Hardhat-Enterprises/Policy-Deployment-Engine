resource "google_iap_brand" "non_compliant_example_1" {
  project           = "non_compliant_example_1"
  support_email     = "support@example.com"
  application_title = "Test"                           #  too generic
}

resource "google_iap_brand" "non_compliant_example_2" {
  project           = "non_compliant_example_2"
  support_email     = "support@example.com"
  application_title = "Demo"                           #  testy
}

resource "google_iap_brand" "non_compliant_example_3" {
  project           = "non_compliant_example_3"
  support_email     = "support@example.com"
  application_title = "My Application"                 #  generic
}

resource "google_iap_brand" "non_compliant_example_4" {
  project           = "non_compliant_example_4"
  support_email     = "support@example.com"
  application_title = "Cloud IAP – Customer Portal "   #  trailing space
}
