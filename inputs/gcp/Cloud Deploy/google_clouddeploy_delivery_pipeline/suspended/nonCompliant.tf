# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_delivery_pipeline" "non_compliant_example_1" {
  name      = "non_compliant_example_1"
  location  = "us-central1"
  project  = "my-project-name"
  
  suspended = true   # NON-COMPLIANT: Pipeline is suspended
}

