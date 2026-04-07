data "google_iam_policy" "c" {
  binding {
    role = "roles/artifactregistry.reader"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_artifact_registry_repository_iam_policy" "c" {
  project = "my-project"
  location = "australia-southeast1"
  repository = "c"
  policy_data = data.google_iam_policy.c.policy_data
}