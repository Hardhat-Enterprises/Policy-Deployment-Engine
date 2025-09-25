resource "google_clouddeploy_custom_target_type" "nc2" {
  location = "us-central1"
  name     = "nc2"
  project  = "my-project-name"

  custom_actions {
    render_action = "unauthorized-render"     
    deploy_action = "deploy-action"        
  }
}