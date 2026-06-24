resource "google_edgecontainer_node_pool" "c" {
  name          = "c" #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-c" #Required
  node_location = "australia-southeast1-edge-customer-a" #Required
  node_count    = 3 #Required

  local_disk_encryption {
    kms_key = "projects/gdce-dev/locations/australia-southeast1/keyRings/gdce-key-ring/cryptoKeys/gdce-disk-key"  # ✅ Proper format
    # kms_key_state = "KEY_AVAILABLE"  # (Output - not set in config)
    # kms_key_active_version = "1"     # (Output - not set in config)
  } #Policy to be tested 
} 

