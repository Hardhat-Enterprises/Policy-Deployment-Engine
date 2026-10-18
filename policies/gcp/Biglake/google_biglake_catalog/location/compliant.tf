# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_biglake_catalog" "compliant_example_1" {
    name     = "compliant_example_1"
    location = "AU"
    project = "smooth-verve-467716-v1"
}
