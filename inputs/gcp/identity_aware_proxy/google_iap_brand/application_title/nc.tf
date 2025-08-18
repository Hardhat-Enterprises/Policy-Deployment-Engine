# Test-y title
resource "google_iap_brand" "brand_test_title" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = "Test Application"               
}

# Demo keyword
resource "google_iap_brand" "brand_demo_title" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = "Demo App"                       
}

# Trailing whitespace
resource "google_iap_brand" "brand_trailing_space" {
  project           = "my-project"
  support_email     = "support@example.com"
  application_title = " "             
}
