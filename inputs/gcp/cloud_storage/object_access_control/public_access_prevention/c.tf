resource "google_storage_object_access_control" "c" {
  object = google_storage_bucket_object.object.output_name
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "domain-domain-example.com"
}

resource "google_storage_bucket" "bucket" {
  name     = "c"
  location = "US"
}

resource "google_storage_bucket_object" "object" {
  name   = "c"
  bucket = google_storage_bucket.bucket.name
  source = "../static/img/header-logo.png"
}