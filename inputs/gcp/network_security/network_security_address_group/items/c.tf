resource "google_network_security_address_group" "c" {

  name     = "c"
  parent   = "projects/123"
  location = "australia-southeast1"
  type     = "IPV4"
  capacity = 100
  items    = ["10.10.0.1"]
}