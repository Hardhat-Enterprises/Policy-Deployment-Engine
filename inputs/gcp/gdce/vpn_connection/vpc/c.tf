resource "google_edgecontainer_vpn_connection" "c" {
  name     = "c" #Required
  location = "australia-southeast1"  #Required
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c" #Required
  vpc      = "projects/gdce-dev/global/networks/production-vpc"  #  Optional but valid format (Policy to be tested)
}