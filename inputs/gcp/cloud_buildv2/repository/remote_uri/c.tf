# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# This resource is compliant with the policy that requires the remote_uri to be an approved URL
# and the parent_connection to be a secure connection.
resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"  
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
