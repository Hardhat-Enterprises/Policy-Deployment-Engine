resource "google_clouddeploy_delivery_pipeline" "compliant_example_1" {
  name            = "compliant_example_1"
  location        = "us-central1"
  project         = "my-project-name"
  deletion_policy = "PREVENT"
}
