resource "google_firestore_document" "compliant_example_1" {
  project      = "c"
  collection   = "my_collection"
  document_id  = "example_doc"
  fields      = jsonencode([
    { name = "field1", value = "abc" },
  ])
}
