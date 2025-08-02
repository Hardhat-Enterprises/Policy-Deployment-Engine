resource "google_storage_object_access_control" "nc" {
  object = google_storage_bucket_object.object_nc.output_name
  bucket = google_storage_bucket.bucket_nc.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "bucket_nc" {
  name     = "static-content-bucket-nc"
  location = "US"
}

resource "google_storage_bucket_object" "object_nc" {
  name   = "public-object-nc"
  bucket = google_storage_bucket.bucket_nc.name
  source = "../static/img/header-logo.png"
}