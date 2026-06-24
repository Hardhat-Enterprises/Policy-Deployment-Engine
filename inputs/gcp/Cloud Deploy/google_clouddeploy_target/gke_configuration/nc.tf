# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_target" "nc" {
  location = "us-central1"
  name     = "nc"
  project  = "my-project-name"
  
  gke {
    cluster    = "projects/my-project-name/locations/us-central1/clusters/my-cluster"
    internal_ip = false
  }
}