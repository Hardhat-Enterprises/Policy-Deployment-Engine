resource "google_edgecontainer_node_pool" "non_compliant_example_1" {
  name          = "non_compliant_example_1" #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-c" #Required
  node_location = "australia-southeast1-edge-customer-a" #Required
  node_count    = 3 #Required

  local_disk_encryption {
    kms_key = "invalid-key-format"  # Invalid format
    # kms_key_state = "KEY_DISABLED"  # Problematic state (output)
  } #Policy to be tested 
}
