resource "google_clouddeploy_target_iam_binding" "nc" {
  name     = "nc"
  project  = "my-project-name"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
  
  members = [
    "allUsers",
    "user:admin@example.com",
    "serviceAccount:deploy-sa@my-project-name.iam.gserviceaccount.com"
  ]
}