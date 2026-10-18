resource "google_beyondcorp_security_gateway" "compliant_example_1" {
  security_gateway_id = "compliant_example_1"
  project             = "smooth-verve-467716-v1"
  hubs { 
    region = "australia-southeast1" 
  }
}
