resource "google_storage_bucket" "c" {
name = "gcp-test-bucket-c"
location ="AUSTRALIA-SOUTHEAST1"
encryption {
  default_kms_key_name = "abc"
}
}
