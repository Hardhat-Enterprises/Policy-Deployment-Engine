resource "google_network_services_multicast_domain_group" "non_compliant_example_1" {
  multicast_domain_group_id = "non-compliant-example-1"
  location                  = "global"
  project                   = "fake-project-id"
}

resource "google_network_services_multicast_domain_group" "non_compliant_example_2" {
  multicast_domain_group_id = "non-compliant-example-2"
  location                  = "global"
  project                   = "fake-project-id"

  labels = {
    team = "infra"
  }
}