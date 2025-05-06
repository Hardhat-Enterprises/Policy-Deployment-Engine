# Non-compliant repository using a blocked region
resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo-non-compliant"
  location          = "europe-west9" # Blacklisted
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
# # This resource is expected to be non-compliant as the `location` is set to "europe-west9", which is in the blacklist of blocked regions.
# # The `parent_connection` is also set to a valid connection, which is compliant with the policy.