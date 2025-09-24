resource "google_netapp_volume" "nc1" {
  location = "us-west2"
  name = "nc1"
  capacity_gib = "100"
  share_name = "test-volume"
  storage_pool = "test-pool"
  protocols = ["NFSV3","SMB"]
  project = "test1"
}





