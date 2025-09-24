# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_delivery_pipeline" "c" {
  name      = "c"
  location  = "us-central1"
  project  = "my-project-name"
  
  suspended = false  # COMPLIANT: Pipeline is active
}
