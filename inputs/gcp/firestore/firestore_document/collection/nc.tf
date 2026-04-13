resource "google_firestore_document" "nc" {
  project     = "nc"
  collection  = "user-private" # 不在白名单，不合规
  document_id = "example_doc_nc"
  fields      = jsonencode({ foo = "bar" })
}
