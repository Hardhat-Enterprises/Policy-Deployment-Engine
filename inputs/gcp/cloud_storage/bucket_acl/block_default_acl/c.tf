resource "google_storage_bucket_acl" "c" {
  bucket = "c"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}
