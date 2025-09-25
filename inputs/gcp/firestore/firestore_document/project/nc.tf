resource "google_firestore_document" "nc" {
  project      = "abc"
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields       = jsonencode({foo = "bar"})
}
