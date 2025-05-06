# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# This is a non-compliant example of a Google Cloud Build v2 repository resource
# that does not use a secure connection for the remote URI and has an invalid parent connection.
resource "google_cloudbuildv2_repository" "nc" {
  name              = "bad-repo"
  location          = "global"
  remote_uri        = "http://untrusted.repo.git"  # ❌ Not using HTTPS
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
