resource "google_firestore_document" "nc" {
  # name        = "nc"
  project      = "abcd_1234"
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields = jsonencode({
    username = "admin"
    password = "123456"   # 明文密码，不合规
  })
  # fields = [
  #
  # ]
}
