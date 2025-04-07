# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_storage_bucket" "c" {
    name = "1234-c"
    location = "AU"
    storage_class = "STANDARD"
}
