resource "google_clouddeploy_custom_target_type" "c" {
  location = "us-central1"
  name     = "c"
  project  = "my-project-name"
  
  custom_actions {
    render_action  = "render-action"
    deploy_action  = "deploy-action"
  }
}
