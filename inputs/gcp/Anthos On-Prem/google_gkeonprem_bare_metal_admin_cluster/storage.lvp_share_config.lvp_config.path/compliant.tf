resource "google_gkeonprem_bare_metal_admin_cluster" "compliant_example_1" {
  name     = "compliant_example_1"
  project  = "PDE"
  location = "australia-southeast1"

  storage {
    lvp_node_mounts_config {
      path          = "/mnt/localpv-node-mounts"
      storage_class = "standard"
    }
    lvp_share_config {
      lvp_config {
        path          = "/mnt/localpv-share"
        storage_class = "standard"
      }
    }
  }
}
