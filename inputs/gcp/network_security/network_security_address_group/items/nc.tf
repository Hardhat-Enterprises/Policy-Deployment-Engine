resource "google_network_security_address_group" "nc" {

  name     = "nc"
  parent   = "projects/123"
  location = "australia-southeast1"
  type     = "IPV4"
  capacity = 100
  items    = ["8.8.8.8"]
}