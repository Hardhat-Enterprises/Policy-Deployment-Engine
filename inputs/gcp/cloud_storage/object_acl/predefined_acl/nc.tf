resource "google_storage_bucket" "image-store_nc" {
  name     = "nc"
  location = "EU"
}

resource "google_storage_bucket_object" "image_nc" {
  name   = "nc"
  bucket = google_storage_bucket.image-store.name
  source = "image1.jpg"
}

resource "google_storage_object_acl" "nc" {
  bucket = google_storage_bucket.image-store_nc.name
  object = google_storage_bucket_object.image_nc.output_name

predefined_acl = "publicRead"
}