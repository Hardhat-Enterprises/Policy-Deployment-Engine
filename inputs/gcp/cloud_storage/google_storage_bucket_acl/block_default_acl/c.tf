resource "google_storage_bucket_acl" "c123" {
  bucket = "c123"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}
