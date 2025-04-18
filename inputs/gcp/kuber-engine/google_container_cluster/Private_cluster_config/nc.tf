# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
  name     = "mycluster-nc"
  location = "AU"

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true

    master_global_access_config {
      enabled = true
    }
  }

  initial_node_count = 1
}