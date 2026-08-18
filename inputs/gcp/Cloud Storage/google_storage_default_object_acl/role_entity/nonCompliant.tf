resource "google_storage_default_object_acl" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"
  role_entity = [
    "OWNER:allAuthenticatedUsers",
    "READER:allUsers",
  ]
}
