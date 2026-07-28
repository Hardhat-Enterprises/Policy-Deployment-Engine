resource "google_netapp_volume" "non_compliant_example_1" {
  location = "us-west2"
  name = "non_compliant_example_1"
  capacity_gib = "100"
  share_name = "test-volume"
  storage_pool = "test-pool"
  protocols = ["NFSV3","SMB"]
  project = "test1"
}

