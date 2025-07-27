resource "google_storage_bucket" "nc" {
  name          = "noncompliant-storage-bucket"
  location      = "US"
  storage_class = "COLDLINE"
  force_destroy = true
}
