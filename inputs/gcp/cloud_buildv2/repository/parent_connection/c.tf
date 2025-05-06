# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# This is a sample code snippet for a Google Cloud Build v2 repository resource with a parent connection
# The resource is compliant as it has a parent connection specified
resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
  # The parent connection is a secure connection that is compliant with the policy
}
