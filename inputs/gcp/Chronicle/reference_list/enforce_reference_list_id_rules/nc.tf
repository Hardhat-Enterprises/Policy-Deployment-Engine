resource "google_chronicle_reference_list" "nc" {
  project  = "fake-project-123"  
  location = "australia-southeast1"
  instance = "scope"
  description = "nc"
  entries {
    value = ""  
  }
  syntax_type = "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING"
  reference_list_id = "1"
}