# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_node_pool" "c" {
  name     = "balanced-node-pool"
 cluster  = "projects/my-project/locations/australia-southeast2/clusters/my-cluster"
  project  = "my-project"
  location = "australia-southeast2"

  autoscaling {
    min_node_count   = 1
    max_node_count   = 5
    location_policy  = "BALANCED"
  }
}
