resource "google_clouddeploy_delivery_pipeline_iam_binding" "c" {
  name     = "c"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
 
  members = [
    "user:dev-team@company.com",
    "serviceAccount:deploy-sa@my-project-id.iam.gserviceaccount.com",
    "group:deploy-team@company.com"
  ]
}