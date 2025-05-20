# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  
  name = "secure-cluster"

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
  }
 
}
