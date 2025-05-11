# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_storage_bucket" "c" {
name = "gcp-test-bucket-c"
location ="AU"
 uniform_bucket_level_access = true
}
