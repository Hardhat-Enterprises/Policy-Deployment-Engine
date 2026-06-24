# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_target_iam_member" "compliant_example_1" {
  project  = "my-project"
  location = "us-central1"
  name     = "compliant_example_1"
  role     = "roles/clouddeploy.developer"
  member   = "user:dev-user@example.com"
}
