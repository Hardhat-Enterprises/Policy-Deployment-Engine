resource "google_storage_object_acl" "compliant_example_1" {
  bucket = "compliant_example_1"
  object = "c123"

  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:group-mygroup",
  ]
}
