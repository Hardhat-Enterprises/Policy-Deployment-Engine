# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_catalog" "nc" {
  name     = "require_project_non_compliant"
  location = "EU"
}
