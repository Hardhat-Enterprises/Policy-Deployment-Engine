resource "google_network_services_multicast_domain_group" "non_compliant_example_1" {
  multicast_domain_group_id = "non-compliant-example-1"
  location                  = "us-central1"
  project                   = "fake-project-id"
  description               = "Non-compliant multicast domain group outside approved region"
}