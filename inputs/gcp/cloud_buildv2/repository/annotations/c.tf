resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"

  annotations = {
    environment     = "production"
    owner           = "dev-team"
    team            = "cloud-security"
    contact         = "security@example.com"
    created_by      = "terraform"
    created_at      = "2024-01-01T00:00:00Z"
    updated_at      = "2024-05-01T00:00:00Z"
  }
}
