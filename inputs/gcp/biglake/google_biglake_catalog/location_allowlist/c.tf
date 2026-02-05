# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_biglake_catalog" "c" {
    name     = "location_allowlist_compliant"
    location = "AU"
}