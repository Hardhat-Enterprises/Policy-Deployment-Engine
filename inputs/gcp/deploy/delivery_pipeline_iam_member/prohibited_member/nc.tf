resource "google_clouddeploy_delivery_pipeline_iam_member" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
  member   = "allUsers"
}