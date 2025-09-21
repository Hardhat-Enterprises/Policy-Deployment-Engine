resource "google_clouddeploy_target_iam_binding" "c" {
  name     = "c"
  project  = "my-project-id"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
 
  members = [
    "user:dev-team@company.com",
    "serviceAccount:deploy-sa@my-project-id.iam.gserviceaccount.com",
    "group:deploy-team@company.com"
  ]
}