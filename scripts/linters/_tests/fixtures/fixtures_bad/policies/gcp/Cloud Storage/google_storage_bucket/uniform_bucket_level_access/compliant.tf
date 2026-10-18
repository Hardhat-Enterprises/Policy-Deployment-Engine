resource "google_storage_bucket" "compliant_example_1" {
  name                        = "compliant_example_1"
  location                    = "AU"
  uniform_bucket_level_access = true
}
