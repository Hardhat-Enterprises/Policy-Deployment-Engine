# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudbuildv2_connection" "nc" {
  name     = "connection-github-config-missing"
  location = "global"
  project =  "policy-deplo"
  disabled = false

  # Missing github_config block entirely
}
