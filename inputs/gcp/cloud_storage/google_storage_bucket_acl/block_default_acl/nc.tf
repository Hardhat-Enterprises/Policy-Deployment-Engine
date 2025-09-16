resource "google_storage_bucket_acl" "nc123" {
  bucket      = "nc123"
  default_acl = "projectPrivate"
}

resource "google_storage_bucket_acl" "nc1234" {
  bucket         = "nc1234"
  predefined_acl = "publicReadWrite"
}
