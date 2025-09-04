resource "google_storage_bucket" "image-store" {
  name     = "c"
  location = "EU"
}

resource "google_storage_default_object_acl" "c" {
  bucket = google_storage_bucket.image-store.name
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}