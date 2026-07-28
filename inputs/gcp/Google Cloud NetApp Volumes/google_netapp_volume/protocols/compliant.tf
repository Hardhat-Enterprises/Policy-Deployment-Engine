resource "google_netapp_volume" "compliant_example_1" {
  location = "us-west2"
  name = "compliant_example_1"
  capacity_gib = "100"
  share_name = "test-volume"
  storage_pool = "test-pool"
  protocols = ["NFSV4"]
  project = "test1"
}

