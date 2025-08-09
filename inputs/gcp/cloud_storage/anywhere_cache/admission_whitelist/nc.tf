resource "google_storage_bucket" "noncompliant_bucket" {
  name     = "au-admission-policy-nc"
  location = "australia-southeast1"
}

resource "google_storage_anywhere_cache" "nc" {
  bucket           = google_storage_bucket.noncompliant_bucket.name
  zone             = "australia-southeast1-b"
  ttl              = "3600s"
  admission_policy = "admit-on-first-miss"  #  Blacklisted
}
