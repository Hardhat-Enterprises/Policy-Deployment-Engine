resource "google_storage_bucket_acl" "compliant_example_1" {
  bucket = "compliant_example_1"

  role_entity = [
    "user:user@example.com",
    "group:admin@example.com",
    "domain:example.com"
  ]
}

