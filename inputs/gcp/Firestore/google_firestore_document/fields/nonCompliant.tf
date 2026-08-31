resource "google_firestore_document" "non_compliant_example_1" {
  project      = "c"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields      = ""
}
