resource "google_chronicle_reference_list" "non_compliant_entries" {
  project  = "fake-project-123"  
  location = "us"
  instance = "scope"
  description = "entries-nc"
  entries {
    value = ""  
  }
  syntax_type = "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING"
  reference_list_id = "valid_reference_list_1"
}