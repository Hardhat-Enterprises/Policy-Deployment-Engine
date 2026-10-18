resource "google_beyondcorp_security_gateway" "non_compliant_example_1" {
  security_gateway_id = "non_compliant_example_1"
  project             = "smooth-verve-467716-v1"
  hubs { 
    region = "us-central1" 
  }
}
