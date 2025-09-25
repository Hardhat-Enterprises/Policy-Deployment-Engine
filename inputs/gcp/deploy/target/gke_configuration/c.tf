# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_target" "c" {
  location = "us-central1"
  name     = "c"
  project  = "my-project-name"
  
  gke {
    cluster    = "projects/my-project-name/locations/us-central1/clusters/my-cluster"
    internal_ip = true
  }
}
