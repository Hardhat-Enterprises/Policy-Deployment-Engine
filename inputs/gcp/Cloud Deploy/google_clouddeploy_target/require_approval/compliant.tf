resource "google_clouddeploy_target" "compliant_example_1" {
  location = "Aus"
  name     = "compliant_example_1"
  project  = "my-project-name"

  require_approval = true
}
