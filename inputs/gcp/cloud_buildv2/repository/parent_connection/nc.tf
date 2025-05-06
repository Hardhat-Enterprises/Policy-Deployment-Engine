# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = ""
  project           = "policy-deplo"
}
