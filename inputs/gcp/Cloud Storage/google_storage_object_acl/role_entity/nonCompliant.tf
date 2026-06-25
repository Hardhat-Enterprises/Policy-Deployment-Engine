resource "google_storage_object_acl" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"
  object = "nc123"

  role_entity = [
    "READER:allUsers"
  ]
}
