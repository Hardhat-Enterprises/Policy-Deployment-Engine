resource "google_storage_bucket" "c" {
  name     = "c123"
  location = "AUSTRALIA-SOUTHEAST1"
  encryption {
    default_kms_key_name = "abc"
  }
}
