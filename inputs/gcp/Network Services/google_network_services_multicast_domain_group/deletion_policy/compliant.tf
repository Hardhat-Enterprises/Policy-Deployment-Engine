resource "google_network_services_multicast_domain_group" "compliant_example_1" {
  multicast_domain_group_id = "compliant-example-1"
  location                  = "global"
  project                   = "fake-project-id"
  description               = "Compliant multicast domain group with deletion protection"

  deletion_policy = "PREVENT"
}
