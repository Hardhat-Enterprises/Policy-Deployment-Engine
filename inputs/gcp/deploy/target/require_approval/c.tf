resource "google_clouddeploy_target" "c" {
  location = "Aus"
  name     = "c"
  project  = "my-project-name"

  require_approval = true
}
