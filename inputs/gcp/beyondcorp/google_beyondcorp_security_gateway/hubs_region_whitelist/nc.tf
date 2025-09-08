resource "google_beyondcorp_security_gateway" "nc" {
  security_gateway_id = "sg-us-c1"
  display_name = "Unapproved SG"
  hubs { 
    region = "us-central1" 
  }
}
