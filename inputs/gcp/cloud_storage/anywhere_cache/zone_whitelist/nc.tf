resource "google_storage_bucket" "noncompliant_bucket" {
  name     = "noncompliant-au-bucket"
  location = "australia-southeast1"
}

resource "google_storage_anywhere_cache" "nc" {
  bucket = google_storage_bucket.noncompliant_bucket.name
  zone   = "us-east1-b"  # Or bad TTL / admission policy, depending on test
  ttl    = "1800s"
}
