# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_target" "compliant_example_1" {
  location = "us-central1"
  name     = "compliant_example_1"
  project  = "my-project-name"
  
  run {
    location = "projects/my-project-name/locations/us-central1"
  }
}
