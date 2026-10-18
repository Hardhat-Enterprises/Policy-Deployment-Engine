resource "google_network_connectivity_destination" "non_compliant_example_1" {
  name                            = "non-compliant-destination"
  project                         = "example-project"
  location                        = "us-central1"
  ip_prefix                       = "10.0.0.0/24"
  multicloud_data_transfer_config = "projects/example-project/locations/us-central1/multicloudDataTransferConfigs/example-config"
  deletion_policy                 = "DELETE"

  endpoints {
    asn = "64512"
    csp = "AWS"
  }
}