resource "google_firestore_document" "c" {
  # name        = "c"
  project      = "abcd_1234"
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields = jsonencode({
    field1 = "hello"
    field2 = 42
  })
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
