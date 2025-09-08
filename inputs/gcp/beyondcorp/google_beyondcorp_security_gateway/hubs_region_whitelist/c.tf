resource "google_beyondcorp_security_gateway" "c" {
  security_gateway_id = "sg-ap-se1"
  display_name = "Approved SG"
  hubs { 
    region = "australia-southeast1" 
  }
}
