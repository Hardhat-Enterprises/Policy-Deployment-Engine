resource "google_storage_bucket" "noncompliant_bucket" {
  name     = "nc123"
  location = "australia-southeast1"
}

resource "google_storage_anywhere_cache" "nc123" {
  bucket = google_storage_bucket.noncompliant_bucket.name
  zone   = "us-east1-b"
  ttl    = "1800s"
}
