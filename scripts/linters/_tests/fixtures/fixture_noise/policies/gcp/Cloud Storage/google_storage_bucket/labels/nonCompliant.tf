resource "google_storage_bucket" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "AU"
  labels = {
    environment = "whatever"
  }
}
