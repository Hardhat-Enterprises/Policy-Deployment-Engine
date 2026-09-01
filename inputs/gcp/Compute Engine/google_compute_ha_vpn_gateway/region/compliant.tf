resource "google_compute_ha_vpn_gateway" "compliant_example_1" {
  name            = "ha-vpn-region-compliant"
  region          = "australia-southeast1"
  network         = "projects/example-project/global/networks/example-network"
  deletion_policy = "PREVENT"
}