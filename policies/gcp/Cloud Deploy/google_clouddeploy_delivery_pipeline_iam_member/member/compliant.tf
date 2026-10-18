resource "google_clouddeploy_delivery_pipeline_iam_member" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
  member   = "serviceAccount:deploy-sa@my-project-id.iam.gserviceaccount.com"
}
