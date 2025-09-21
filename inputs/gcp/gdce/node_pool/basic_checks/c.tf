resource "google_edgecontainer_node_pool" "c" { 
  #This is basic check policy, as i need to compulsary do this to test other policies, so that is why this module is named basic_checks 
  name          = "c"  #  #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-c"    # Valid cluster #Required
  node_location = "australia-southeast1-edge-customer-a"  # Approved location #Required
  node_count    = 3                        # Within 1-5 range #Required #Required
}