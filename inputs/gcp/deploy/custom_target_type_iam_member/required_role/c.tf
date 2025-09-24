# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_custom_target_type_iam_member" "c" {
  project  = "my-project"
  location = "us-central1"
  name     = "c"
  role     = "roles/clouddeploy.developer"
  member   = "user:dev-user@example.com"
}