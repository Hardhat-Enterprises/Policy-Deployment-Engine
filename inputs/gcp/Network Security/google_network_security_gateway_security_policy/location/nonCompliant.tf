resource "google_network_security_gateway_security_policy" "non_compliant_example_1" {

  provider = google-beta
  name     = "non_compliant_example_1"
  project  = "123"
  location = "asia-east1"
}
