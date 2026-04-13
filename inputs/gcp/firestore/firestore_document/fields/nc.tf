resource "google_firestore_document" "nc" {
  project     = "nc"
  collection  = "my_collection"
  document_id = "example_doc"
  fields      = ""
}
