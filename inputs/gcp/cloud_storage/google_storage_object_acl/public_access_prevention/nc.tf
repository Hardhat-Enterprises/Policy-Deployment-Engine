resource "google_storage_bucket" "image-store_nc" {
  name     = "nc123"
  location = "EU"
}

resource "google_storage_bucket_object" "image_nc" {
  name   = "nc123"
  bucket = google_storage_bucket.image-store_nc.name
  source = "image1.jpg"
}

resource "google_storage_object_acl" "nc123" {
  bucket = google_storage_bucket.image-store_nc.name
  object = google_storage_bucket_object.image_nc.output_name

  role_entity = [
    "READER:allUsers"
  ]
}