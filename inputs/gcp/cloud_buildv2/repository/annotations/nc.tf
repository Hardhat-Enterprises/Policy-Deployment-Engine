resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo-non-compliant"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"

  annotations = {
    team       = "cloud-infra"
    contact    = ""
    created_by = ""
    environment = "testing"  # Not in whitelist: ["production", "staging", "dev"]
    unapproved_key = "unexpected" 
    owner          = ""
    created_at     = ""
    updated_at     = ""
    version        = ""
    repository_type = ""
    repository_url  = ""
    repository_name = ""
    description     = ""
  }
}
# This resource is expected to be non-compliant due to the following reasons:
# - The `environment` annotation is set to "testing", which is not in the whitelist of allowed values.
# - The `unapproved_key` annotation is present, which is not allowed.
# - The `owner`, `created_at`, `updated_at`, `version`, `repository_type`, `repository_url`, `repository_name`, and `description` annotations are empty, which is not compliant with the required annotation structure.
