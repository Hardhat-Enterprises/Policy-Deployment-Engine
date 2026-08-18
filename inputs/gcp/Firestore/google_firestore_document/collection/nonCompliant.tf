resource "google_firestore_document" "non_compliant_example_1" {
  project      = "nc"
  collection   = "user-private" # 不在白名单，不合规
  document_id  = "example_doc_nc"
  fields      = jsonencode({foo = "bar"})
}
