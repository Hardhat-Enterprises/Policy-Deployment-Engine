resource "google_storage_default_object_access_control" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"
  role   = "READER"
  entity = "allUsers"
}

