resource "google_network_security_gateway_security_policy" "compliant_example_1" {

  provider = google-beta
  name     = "compliant_example_1"
  project  = "123"
  location = "australia-southeast1"
}
