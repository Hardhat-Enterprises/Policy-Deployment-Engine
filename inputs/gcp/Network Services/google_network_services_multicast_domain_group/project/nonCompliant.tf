resource "google_network_services_multicast_domain_group" "non_compliant_example_1" {
  multicast_domain_group_id = "non-compliant-example-1"
  location                  = "global"
  project                   = "random-unapproved-project"
  description               = "Non-compliant multicast domain group in an unapproved project"
}