# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_storage_bucket" "nc" {
    name = "1234-nc"
    location = "AU"
    storage_class = "STANDARDZ"
}