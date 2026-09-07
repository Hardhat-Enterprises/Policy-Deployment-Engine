resource "google_firestore_document" "non_compliant_example_1" {
  project      = "c"
  collection   = "user-private" # 不在白名单，不合规
  document_id  = "example_doc"
  fields      = jsonencode({foo = "bar"})
}
