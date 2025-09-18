resource "google_edgecontainer_node_pool" "nc" {
  name          = "nc" #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-c" #Required
  node_location = "australia-southeast2" #Required
  node_count    = 2 #Required 

  local_disk_encryption {
    kms_key = "invalid-key-format"  # Invalid format
    # kms_key_state = "KEY_DISABLED"  # Problematic state (output)
  } #Policy to be tested 
}