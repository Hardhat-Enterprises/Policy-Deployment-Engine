# Non-Compliant Terraform File (nc.tf)
resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo-non-compliant"
  location          = "europe-west9"  # Not in approved regions
  remote_uri        = "https://github.com/example/repo.git"
  parent_connection = "projects/demo/locations/global/connections/disabled-connection" # Disabled connection
  project           = "policy-deplo"

  annotations = {
    environment     = "test"                        #  Not in approved list ("production", "dev")
    owner           = ""                            #  Missing/empty
    team            = "infra"                       
    contact         = ""                            #  Missing/empty
    created_by      = "unknown"                     #  Not traceable
    created_at      = ""                            #  Empty
    updated_at      = ""                            #  Empty
    version         = ""                            #  Empty
    repository_type = ""                            #  Empty
    repository_url  = "not-a-valid-url"             #  Malformed
    repository_name = ""                            #  Empty
    description     = ""                            #  Empty
    unapproved_key  = "this-should-not-be-here"     #  Extra unapproved key
  }
}
# # This resource is expected to be non-compliant due to the following reasons:
# # - The `location` is set to "europe-west9", which is not in the approved regions.