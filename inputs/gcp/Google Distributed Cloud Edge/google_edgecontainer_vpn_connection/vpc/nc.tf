resource "google_edgecontainer_vpn_connection" "nc" {
  name     = "nc"  #  Doesn't start with "vpn-" #Required
  location = "invalid-region"  #  Not approved location #Required
  cluster  = "invalid-cluster-format"  #  Wrong cluster format #Required
  vpc      = "invalid-vpc-format"  #  Wrong VPC format (Policy to be tested)
}
