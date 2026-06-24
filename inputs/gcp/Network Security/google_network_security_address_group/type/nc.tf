resource "google_network_security_address_group" "nc" {

  name     = "nc"
  parent   = "projects/123"
  location = "global"
  type     = "IPV6"
  capacity = 100
}