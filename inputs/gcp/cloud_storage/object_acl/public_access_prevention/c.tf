resource "google_storage_bucket" "image-store" {
  name     = "image-store-bucket-c"
  location = "EU"
}

resource "google_storage_bucket_object" "image" {
  name   = "image1"
  bucket = google_storage_bucket.image-store.name
  source = "image1.jpg"
}

resource "google_storage_object_acl" "c" {
  bucket = google_storage_bucket.image-store.name
  object = google_storage_bucket_object.image.output_name

  role_entity = [
    "READER:group-example@googlegroups.com"
  ]
}