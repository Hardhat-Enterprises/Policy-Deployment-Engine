resource "google_beyondcorp_security_gateway" "c" {
  security_gateway_id = "sg-payments-prod-1" 
  display_name = "Payments SG"
  hubs { 
    region = "australia-southeast1" 
  }
}
