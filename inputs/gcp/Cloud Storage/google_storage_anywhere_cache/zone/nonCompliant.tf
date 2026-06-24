resource "google_storage_anywhere_cache" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"
  zone   = "us-east1-b"
  ttl    = "1800s"
}
