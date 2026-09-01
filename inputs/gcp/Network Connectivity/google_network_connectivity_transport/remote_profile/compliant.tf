resource "google_network_connectivity_transport" "compliant_example_1" {
  name   = "compliant-transport"
  region = "us-east4"

  remote_profile    = "https://networkconnectivity.googleapis.com/v1beta/approved-network-project/locations/us-east4/remoteTransportProfiles/aws-us-east-1"
  network           = "approved-network"
  bandwidth         = "BPS_1G"
  remote_account_id = "123"
}