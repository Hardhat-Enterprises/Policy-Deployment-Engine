resource "google_clouddeploy_target" "nc" {
  location = "Aus"
  name     = "testgcptarget-nc"
  project  = "my-project-name"
 
  require_approval = false
}
