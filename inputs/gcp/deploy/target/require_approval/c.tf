resource "google_clouddeploy_target" "c" {
  location = "Aus"
  name     = "testgcptarget-c"
  project  = "my-project-name"

  require_approval = true
}
