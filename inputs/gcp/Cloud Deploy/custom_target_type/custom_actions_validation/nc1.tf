resource "google_clouddeploy_custom_target_type" "nc1" {
  location = "us-central1"
  name     = "nc1"
  project  = "my-project-name"

  custom_actions {
    render_action = "render-action"     
    deploy_action = "unauthorized-deploy"        
  }
}