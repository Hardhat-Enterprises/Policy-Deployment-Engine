# Purpose: Ensure that IAM bindings only grant access to service accounts (not individual users).
# member must match serviceAccount

resource "google_artifact_registry_repository_iam_member" "c" {
  repository = "secure-repo"
  location   = "AU"
  project    = "your-secure-project-id"
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:ci-bot@yourproject.iam.gserviceaccount.com"
}

