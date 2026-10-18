# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_target" "non_compliant_example_1" {
  location = "us-central1"
  name     = "non_compliant_example_1"
  project  = "my-project-name"
  
  gke {
    cluster    = "projects/my-project-name/locations/us-central1/clusters/my-cluster"
    internal_ip = false
  }
}
