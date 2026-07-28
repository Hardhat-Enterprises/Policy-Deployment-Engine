resource "google_storage_bucket_access_control" "compliant_example_1" {
  bucket = "compliant_example_1"

  role   = "READER"
  entity = "user:user@example.com" # Approved entity
}
