resource "google_storage_default_object_access_control" "compliant_example_1" {
  bucket = "compliant_example_1"
  role   = "READER"
  entity = "domain-example.com"
}

