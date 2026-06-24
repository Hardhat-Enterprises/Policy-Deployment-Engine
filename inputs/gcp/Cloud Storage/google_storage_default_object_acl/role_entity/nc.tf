resource "google_storage_bucket" "image-store_nc" {
  name     = "nc123"
  location = "EU"
}

resource "google_storage_default_object_acl" "nc123" {
  bucket = google_storage_bucket.image-store_nc.name
  role_entity = [
    "OWNER:allAuthenticatedUsers",
    "READER:allUsers",
  ]
}