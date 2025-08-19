# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_custom_target_type" "c" {
  location = "us-central1"
  name     = "test-custom-target-c"
  project  = "my-project-name"
  
  custom_actions {
    render_action  = "render-action"
    deploy_action  = "deploy-action"
  }
}
