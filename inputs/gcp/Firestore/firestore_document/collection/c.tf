resource "google_firestore_document" "c" {
  project      = "c"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields      = jsonencode({foo = "bar"})
}
