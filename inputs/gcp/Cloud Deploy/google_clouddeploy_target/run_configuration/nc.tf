# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_target" "nc" {
  location = "us-west2"
  name     = "nc"
  project  = "my-project-name"
  
  run {
    location = "projects/my-project-name/locations/us-west2"
  }
}