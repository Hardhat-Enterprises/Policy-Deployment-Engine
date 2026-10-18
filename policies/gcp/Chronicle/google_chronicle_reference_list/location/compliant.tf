resource "google_chronicle_reference_list" "compliant_example_1" {
  project     = "fake-project-123"
  location    = "australia-southeast1"
  instance    = "scope-c"
  description = "compliant_example_1"
  entries {
    value = "valid_entry_2"
  }
  syntax_type       = "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING"
  reference_list_id = "valid_reference_list"
}
