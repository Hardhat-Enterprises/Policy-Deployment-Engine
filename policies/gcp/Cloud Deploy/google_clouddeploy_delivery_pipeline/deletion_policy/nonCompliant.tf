resource "google_clouddeploy_delivery_pipeline" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  location        = "us-central1"
  project         = "my-project-name"
  deletion_policy = "DELETE"
}
