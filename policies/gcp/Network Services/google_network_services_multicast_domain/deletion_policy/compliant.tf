resource "google_network_services_multicast_domain" "compliant_example_1" {
  multicast_domain_id = "compliant-example-1"
  location            = "global"
  admin_network       = "projects/test-project/locations/global/networks/example-network"

  connection_config {
    connection_type = "SAME_VPC"
  }

  deletion_policy = "PREVENT"
}