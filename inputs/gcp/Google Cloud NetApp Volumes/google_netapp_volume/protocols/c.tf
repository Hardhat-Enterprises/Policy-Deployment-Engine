resource "google_netapp_volume" "c1" {
  location = "us-west2"
  name = "c1"
  capacity_gib = "100"
  share_name = "test-volume"
  storage_pool = "test-pool"
  protocols = ["NFSV4"]
  project = "test1"
}

