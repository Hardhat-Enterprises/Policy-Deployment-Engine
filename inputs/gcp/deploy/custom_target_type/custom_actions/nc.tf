# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_custom_target_type" "nc" {
  location = "us-central1"
  name     = "test-custom-target-nc"
  project  = "my-project-name"
}