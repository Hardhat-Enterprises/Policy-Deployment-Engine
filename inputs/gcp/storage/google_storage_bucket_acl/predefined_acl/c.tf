resource "google_storage_bucket" "c" {
  name     = "compliant-bucket"
  location = "US"
}

resource "google_storage_bucket_acl" "c" {
  bucket = google_storage_bucket.c.name
  role_entity = [
    "OWNER:user@example.com",
    "READER:group@example.com"
  ]  # ✅
}
