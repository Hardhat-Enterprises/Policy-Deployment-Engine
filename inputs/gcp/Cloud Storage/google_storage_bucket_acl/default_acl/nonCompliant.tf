resource "google_storage_bucket_acl" "non_compliant_example_1" {
  bucket      = "non_compliant_example_1"
  default_acl = "projectPrivate"
}

resource "google_storage_bucket_acl" "non_compliant_example_2" {
  bucket         = "non_compliant_example_2"
  predefined_acl = "publicReadWrite"
}
