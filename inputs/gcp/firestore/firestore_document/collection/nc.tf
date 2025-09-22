resource "google_firestore_document" "nc" {
  # name        = "nc"
  project      = "abcd_1234"
  database     = "(default)"
  collection   = "user-private" # 不在白名单，不合规
  document_id  = "example_doc_nc"
  fields      = jsonencode({foo = "bar"})
  # fields = [
  #   {
  #     name = "field1"
  #     type = "string"
  #   },
  #   {
  #     name = "field2"
  #     type = "integer"
  #   }
  # ]
  
}
