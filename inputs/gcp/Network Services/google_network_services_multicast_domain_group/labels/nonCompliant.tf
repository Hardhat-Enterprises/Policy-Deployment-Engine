resource "google_network_services_multicast_domain_group" "non_compliant_example_1" {
  multicast_domain_group_id = "non-compliant-example-1"
  location                  = "global"
  project                   = "fake-project-id"
  description               = "Non-compliant multicast domain group with no labels"
}

resource "google_network_services_multicast_domain_group" "non_compliant_example_2" {
  multicast_domain_group_id = "non-compliant-example-2"
  location                  = "global"
  project                   = "fake-project-id"
  description               = "Non-compliant multicast domain group missing required label keys"

  labels = {
    team = "infra"
  }
}