# Compliant repository located in an approved region
resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo-compliant"
  location          = "us-central1" # Approved
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
# # This resource is expected to be compliant as the `location` is set to "us-central1", which is in the whitelist of allowed locations.
# # The `parent_connection` is also set to a valid connection, which is compliant with the policy.