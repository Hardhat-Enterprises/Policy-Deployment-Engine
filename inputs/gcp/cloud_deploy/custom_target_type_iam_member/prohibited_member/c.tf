resource "google_clouddeploy_custom_target_type_iam_member" "c" {
  name     = "c"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
  member   = "serviceAccount:deploy-sa@my-project-id.iam.gserviceaccount.com"
}