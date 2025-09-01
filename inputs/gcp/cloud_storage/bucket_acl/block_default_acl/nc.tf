resource "google_storage_bucket_acl" "nc" {
  bucket      = "nc-bucket"
  default_acl = "projectPrivate"
}

resource "google_storage_bucket_acl" "nc1" {
  bucket      = "nc1-bucket"
  predefined_acl = "publicReadWrite"
}
