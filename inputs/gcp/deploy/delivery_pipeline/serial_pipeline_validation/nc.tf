# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_delivery_pipeline" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "my-project-name"  
}