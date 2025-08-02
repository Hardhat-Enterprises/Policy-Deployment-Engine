resource "google_storage_bucket" "image-store_nc" {
  name     = "image-store-bucket-nc"
  location = "EU"
}

resource "google_storage_default_object_acl" "nc" {
  bucket = google_storage_bucket.image-store_nc.name
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:allUsers",
  ]
}