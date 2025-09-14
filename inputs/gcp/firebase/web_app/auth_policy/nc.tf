resource "google_storage_bucket" "nc" {
  name     = "noncompliant-bucket-test"
  location = "EU"
}
