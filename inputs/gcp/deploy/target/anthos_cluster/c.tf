# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_target" "c" {
  location = "us-central1"
  name     = "testgcptarget-c"
  project  = "my-project-name"
  
  anthos_cluster {
    membership = "projects/my-project/locations/us-central1/memberships/prod-secure-hybrid-cluster"
  }
}