resource "google_storage_bucket" "c_bucket" {
  name     = "compliant-bucket"
  location = "US"
}

resource "google_storage_bucket_acl" "c" {
  bucket = google_storage_bucket.c_bucket.name
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}
