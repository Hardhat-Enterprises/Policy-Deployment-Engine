resource "google_storage_object_access_control" "nc123" {
  object = google_storage_bucket_object.object_nc.output_name
  bucket = google_storage_bucket.bucket_nc.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "bucket_nc" {
  name     = "nc123"
  location = "US"
}

resource "google_storage_bucket_object" "object_nc" {
  name   = "nc123"
  bucket = google_storage_bucket.bucket_nc.name
  source = "../static/img/header-logo.png"
}