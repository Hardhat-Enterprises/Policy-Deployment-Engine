# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_catalog" "nc" {
    name     = "nc"
    location = "EU"
    project = "smooth-verve-467716-v1"
}