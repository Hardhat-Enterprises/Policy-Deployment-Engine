resource "google_network_security_address_group" "c" {
    
  name     = "c"
  parent   = "projects/123"
  location = "global"
  type     = "IPV4"
  capacity = 100
}