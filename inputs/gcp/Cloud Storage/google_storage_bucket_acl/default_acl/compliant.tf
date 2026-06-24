resource "google_storage_bucket_acl" "compliant_example_1" {
  bucket = "compliant_example_1"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}
