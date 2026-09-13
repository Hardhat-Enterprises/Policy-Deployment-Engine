resource "google_network_services_multicast_domain" "non_compliant_example_1" {
  multicast_domain_id = "non-compliant-example-1"
  location            = "us-central1"
  admin_network       = "projects/test-project/locations/global/networks/example-network"

  connection_config {
    connection_type = "SAME_VPC"
  }
}