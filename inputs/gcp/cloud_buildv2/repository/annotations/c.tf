resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo-compliant"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"

  annotations = {
    owner           = "dev-team"
    team            = "cloud-infra"
    contact         = "dev-team@example.com"
    created_by      = "terraform"
    created_at      = "2023-01-01T00:00:00Z"
    updated_at      = "2024-04-01T00:00:00Z"
    version         = "v1.2.3"
    repository_type = "internal"
    repository_url  = "https://github.com/secure/repo"
    repository_name = "secure-repo"
    description     = "Managed by Terraform for secure builds."
    environment     = "production"
  }
}
