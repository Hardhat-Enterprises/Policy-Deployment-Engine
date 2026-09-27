resource "google_network_services_authz_extension" "compliant_example_1" {
  name     = "compliant-example-1"
  location = "australia-southeast1"
  service  = "iap.googleapis.com"
  timeout  = "0.1s"

  fail_open = false
}