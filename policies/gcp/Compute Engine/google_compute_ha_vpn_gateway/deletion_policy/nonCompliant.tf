resource "google_compute_ha_vpn_gateway" "non_compliant_example_1" {
  name            = "ha-vpn-non-compliant"
  region          = "australia-southeast1"
  network         = "projects/example-project/global/networks/example-network"
  deletion_policy = "DELETE"
}