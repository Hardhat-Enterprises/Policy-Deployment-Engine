resource "google_storage_bucket" "compliant_example_1" {
  name     = "c123"
  location = "AUSTRALIA-SOUTHEAST1"
  encryption {
    default_kms_key_name = "abc"
  }
}
