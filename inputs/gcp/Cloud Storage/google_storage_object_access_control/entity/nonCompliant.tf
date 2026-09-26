resource "google_storage_object_access_control" "non_compliant_example_1" {
  object = "c123"
  bucket = "non_compliant_example_1"
  role   = "READER"
  entity = "allUsers"
}

