# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name     = "mycluster-c"
  location = "AU"

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true

    master_global_access_config {
      enabled = false
    }
  }

  initial_node_count = 1
}