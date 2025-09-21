resource "google_chronicle_reference_list" "nc" {
  project  = "fake-project-123"  
  location = "italy"
  instance = "scope-c"
  description = "nc"
  entries {
    value = "valid_entry_2"
  }
  syntax_type = "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING"
  reference_list_id = "valid_reference_list"
}
