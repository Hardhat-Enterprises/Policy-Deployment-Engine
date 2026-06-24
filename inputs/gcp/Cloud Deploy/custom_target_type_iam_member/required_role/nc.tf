# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_custom_target_type_iam_member" "nc" {
  project  = "my-project"
  location = "us-central1"
  name     = "nc"
  role     = "roles/owner" # Not part of whitelist
  member   = "user:admin-user@example.com"
}