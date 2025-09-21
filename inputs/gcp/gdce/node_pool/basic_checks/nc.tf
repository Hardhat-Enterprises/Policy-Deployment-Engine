resource "google_edgecontainer_node_pool" "nc" {
  name          = "nc"            #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-nc"   # Valid cluster (but will fail other checks) #Required
  node_location = "australia-southeast2"       # Not approved location #Required
  node_count    = 10                       # Exceeds max of 5 #Required
}