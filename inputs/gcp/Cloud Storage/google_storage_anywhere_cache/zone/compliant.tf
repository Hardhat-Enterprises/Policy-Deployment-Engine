resource "google_storage_anywhere_cache" "compliant_example_1" {
  bucket = "compliant_example_1"
  zone   = "australia-southeast1-b"
  ttl    = "3600s"
}
