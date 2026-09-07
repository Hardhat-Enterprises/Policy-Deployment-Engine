resource "google_network_services_multicast_domain_activation" "non_compliant_example_1" {
  multicast_domain_activation_id = "test-domain-activation"
  project                        = "test-project"
  location                       = "us-east1-b"

  multicast_domain = "projects/test-project/locations/global/multicastDomains/test-domain"
}

