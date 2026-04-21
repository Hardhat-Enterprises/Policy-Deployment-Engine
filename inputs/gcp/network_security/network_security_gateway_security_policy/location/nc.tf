resource "google_network_security_gateway_security_policy" "nc" {

  provider = google-beta
  name     = "nc"
  project  = "123"
  location = "asia-east1"
}