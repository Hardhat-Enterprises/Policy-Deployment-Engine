# Compliant Terraform File (c.tf)
resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo-compliant"
  location          = "global"
  remote_uri        = "https://github.com/example/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"

  annotations = {
    environment     = "production"
    owner           = "dev-team"
    team            = "infra"
    contact         = "dev-team@example.com"
    created_by      = "terraform"
    created_at      = "2024-01-01T00:00:00Z"
    updated_at      = "2024-05-01T00:00:00Z"
    version         = "v1.0.0"
    repository_type = "internal"
    repository_url  = "https://github.com/example/repo"
    repository_name = "secure-repo"
    description     = "Compliant secure GCB repository"
  }
}
# # This resource is expected to be compliant as it has the required annotations and the `parent_connection` is set to a valid connection.
# # The `environment` annotation is set to "production", which is in the whitelist of allowed values.