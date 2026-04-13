resource "google_network_security_gateway_security_policy" "c" {
    
  provider = google-beta
  name     = "c"
  project  = "123"
  location = "australia-southeast1"
}