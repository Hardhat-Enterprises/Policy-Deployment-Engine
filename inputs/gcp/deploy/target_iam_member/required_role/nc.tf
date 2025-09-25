# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_target_iam_member" "nc" {
  project  = "my-project"
  location = "us-central1"
  name     = "nc"
  role     = "roles/owner"
  member   = "user:admin-user@example.com"
}