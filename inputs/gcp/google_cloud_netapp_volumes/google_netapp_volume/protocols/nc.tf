resource "google_netapp_volume" "nc_test_volume" {
  location = "us-west2"
  name = "test-volume"
  capacity_gib = "100"
  share_name = "test-volume"
  storage_pool = "test-pool"
  protocols = ["NFSV3","SMB"]
  project = "test1"
}





