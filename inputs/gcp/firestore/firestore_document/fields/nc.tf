resource "google_firestore_document" "nc" {
  name        = "nc"
  project      = "abcd_1234"
  database     = "(default)"
  collection   = "my_collection"
  document_id  = "example_doc"
  # fields = [
  #
  # ]
}
