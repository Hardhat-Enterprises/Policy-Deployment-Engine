resource "google_clouddeploy_target_iam_binding" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  project  = "my-project-id"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
  
  members = [
    "allUsers",
    "user:admin@example.com",
    "serviceAccount:deploy-sa@my-project-name.iam.gserviceaccount.com"
  ]
}
