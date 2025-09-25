
resource "google_beyondcorp_security_gateway" "c" {
  security_gateway_id = "c"
  project             = "smooth-verve-467716-v1"
  hubs { 
    region = "australia-southeast1" 
  }
}
