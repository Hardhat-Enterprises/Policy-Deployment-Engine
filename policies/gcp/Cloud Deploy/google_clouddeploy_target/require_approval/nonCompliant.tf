resource "google_clouddeploy_target" "non_compliant_example_1" {
  location = "Aus"
  name     = "non_compliant_example_1"
  project  = "my-project-name"
 
  require_approval = false
}
