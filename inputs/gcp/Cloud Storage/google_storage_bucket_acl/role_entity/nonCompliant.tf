resource "google_storage_bucket_acl" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"

  role_entity = [
    "OWNER:allUsers",
    "user:unauthorized@example.com"
  ]
}
