resource "google_artifact_registry_repository_iam_member" "non_compliant_example_1" {
  project    = "my-project"
  location   = "australia-southeast1"
  repository = "my-repo"
  role       = "roles/admin" # Not part of whitelist
  member     = "user:jane@example.com"
}
