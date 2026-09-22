resource "google_network_services_multicast_domain_activation" "compliant_example_1" {
  multicast_domain_activation_id = "test-domain-activation"
  project                        = "test-project"
  location                       = "us-central1-b"

  multicast_domain = "projects/test-project/locations/global/multicastDomains/test-domain"

  deletion_policy = "PREVENT"
}