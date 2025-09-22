resource "google_firestore_document" "nc" {
  # name        = "nc"
  project      = "abcd1234"
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
   fields      = jsonencode([
    { name = "field1", value = "abc" },
    # { name = "field3", value = "1234" }
    # 缺 field2
  ])
}
