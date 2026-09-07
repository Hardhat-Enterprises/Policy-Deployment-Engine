# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_target_iam_member" "non_compliant_example_1" {
  project  = "my-project"
  location = "us-central1"
  name     = "non_compliant_example_1"
  role     = "roles/owner"
  member   = "user:dev-user@example.com"
}
