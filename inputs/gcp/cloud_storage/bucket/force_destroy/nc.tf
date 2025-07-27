# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_storage_bucket" "nc" {
name = "gcp-test-bucket-nc"

location ="AU"
force_destroy = true
}