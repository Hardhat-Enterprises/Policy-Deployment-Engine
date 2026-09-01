resource "google_network_connectivity_transport" "non_compliant_example_1" {
  name   = "non-compliant-transport"
  region = "us-east4"

  remote_profile    = "https://networkconnectivity.googleapis.com/v1beta/unapproved-network-project/locations/us-east4/remoteTransportProfiles/unapproved-profile"
  network           = "approved-network"
  bandwidth         = "BPS_1G"
  remote_account_id = "123"
}