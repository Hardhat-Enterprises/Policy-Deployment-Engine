# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_container_cluster" "nc" {
  
  name = "nonsecure-cluster"

  addons_config {
    horizontal_pod_autoscaling {
      disabled = true
    }
  }
 
}
