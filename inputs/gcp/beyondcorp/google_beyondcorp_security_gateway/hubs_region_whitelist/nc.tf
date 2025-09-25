
resource "google_beyondcorp_security_gateway" "nc" {
  security_gateway_id = "nc"
  project             = "smooth-verve-467716-v1"
  hubs { 
    region = "us-central1" 
  }
}
