resource "google_storage_bucket" "compliant_bucket" {
  name     = "au-admission-policy"
  location = "australia-southeast1"
}

resource "google_storage_anywhere_cache" "c" {
  bucket           = google_storage_bucket.compliant_bucket.name
  zone             = "australia-southeast1-b"
  ttl              = "3600s"
  admission_policy = "admit-on-second-miss"
}
