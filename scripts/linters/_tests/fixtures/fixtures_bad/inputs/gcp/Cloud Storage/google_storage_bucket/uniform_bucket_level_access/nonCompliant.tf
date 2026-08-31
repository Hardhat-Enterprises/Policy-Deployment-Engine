resource "google_storage_bucket" "non_compliant_example_1" {
  name                        = "non_compliant_example_1"
  location                    = "AU"
  uniform_bucket_level_access = false
}
