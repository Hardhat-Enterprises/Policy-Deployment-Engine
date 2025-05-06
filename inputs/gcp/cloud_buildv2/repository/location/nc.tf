# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo"
  location          = "us-central1"  # Not allowed
  remote_uri        = "https://github.com/secure/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
  # Optional attributes
}