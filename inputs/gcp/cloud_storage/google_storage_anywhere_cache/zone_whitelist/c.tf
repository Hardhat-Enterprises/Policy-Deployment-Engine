resource "google_storage_bucket" "compliant_bucket" {
  name     = "c123"
  location = "australia-southeast1"
}

resource "google_storage_anywhere_cache" "c123" {
  bucket = google_storage_bucket.compliant_bucket.name
  zone   = "australia-southeast1-b"
  ttl    = "3600s"
}
