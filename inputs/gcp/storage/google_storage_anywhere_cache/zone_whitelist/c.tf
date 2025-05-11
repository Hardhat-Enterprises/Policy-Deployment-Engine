resource "google_storage_bucket" "compliant_bucket" {
  name     = "compliant-au-bucket"
  location = "australia-southeast1"
}

resource "google_storage_anywhere_cache" "c" {
  bucket = google_storage_bucket.compliant_bucket.name
  zone   = "australia-southeast1-b"
  ttl    = "3600s"
}
