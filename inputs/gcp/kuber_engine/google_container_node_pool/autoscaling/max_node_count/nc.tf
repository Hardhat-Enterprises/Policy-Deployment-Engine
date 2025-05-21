# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_node_pool" "nc" {
  name     = "autoscaling-loc-not-balanced"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/my-cluster"
  project  = "my-project"
  location = "australia-southeast2"

  autoscaling {
    location_policy = "ANY"
  }
}
