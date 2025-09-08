resource "google_beyondcorp_security_gateway" "nc" {
  security_gateway_id = "1_sg!bad" 
  display_name = "Bad ID"
  hubs { 
    region = "australia-southeast1" 
  }
}
