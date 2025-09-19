resource "google_firestore_document" "nc" {
  # project      = ""
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields = [
    {
      name = "field1"
      type = "string"
    },
    {
      name = "field2"
      type = "integer"
    }
  ]
}
