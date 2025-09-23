resource "google_firestore_document" "c" {
  # name        = "c"
  project      = "abcd1234"
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields      = jsonencode([
    { name = "field1", value = "abc" },
    # { name = "field2", value = "1234" }
  ])
}
