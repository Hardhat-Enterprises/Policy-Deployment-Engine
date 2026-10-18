# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_delivery_pipeline" "compliant_example_1" {
  name      = "compliant_example_1"
  location  = "us-central1"
  project  = "my-project-name"
  
  suspended = false  # COMPLIANT: Pipeline is active
}
