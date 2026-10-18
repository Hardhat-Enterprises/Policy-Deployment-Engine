resource "google_storage_object_access_control" "compliant_example_1" {
  object = "c123"
  bucket = "compliant_example_1"
  role   = "READER"
  entity = "domain-domain-example.com"
}

