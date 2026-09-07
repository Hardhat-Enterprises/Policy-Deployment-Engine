resource "google_edgecontainer_vpn_connection" "non_compliant_example_1" {
  name     = "non_compliant_example_1"  #  Doesn't start with "vpn-" #Required
  location = "australia-southeast1"  #Required
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c" #Required
  vpc      = "invalid-vpc-format"  #  Wrong VPC format (Policy to be tested)
}
