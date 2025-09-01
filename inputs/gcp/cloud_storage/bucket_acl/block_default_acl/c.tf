resource "google_storage_bucket_acl" "c" {
  bucket = "c-bucket"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}
