# Prevent assigning IAM roles to members from external projects/domains (e.g., service accounts from other organizations).

resource "google_artifact_registry_repository_iam_member" "c" {
  repository = "secure-repo"
  location   = "AU"
  project    = "your-project-id"
  role       = "roles/artifactregistry.reader"
  member     = "user:employee@your-company.com"
}

