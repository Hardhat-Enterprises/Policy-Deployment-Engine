# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_target" "nc" {
  location = "us-central1"
  name     = "testgcptarget-nc"
  project  = "my-project-name"
  
  anthos_cluster {
    membership = "projects/my-project/locations/us-central1/memberships/insecure-test-cluster"
  }
}