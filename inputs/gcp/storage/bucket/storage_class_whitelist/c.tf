resource "google_storage_bucket" "c" {
  name          = "compliant-storage-bucket"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true
}
