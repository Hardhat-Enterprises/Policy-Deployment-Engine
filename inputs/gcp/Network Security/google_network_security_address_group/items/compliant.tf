resource "google_network_security_address_group" "compliant_example_1" {

  name     = "compliant_example_1"
  parent   = "projects/123"
  location = "australia-southeast1"
  type     = "IPV4"
  capacity = 100
  items    = ["10.10.0.1/30"]
}
