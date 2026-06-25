resource "google_network_security_address_group" "non_compliant_example_1" {

  name     = "non_compliant_example_1"
  parent   = "projects/123"
  location = "global"
  type     = "IPV6"
  capacity = 100
}
