resource "google_chronicle_reference_list" "compliant_list" {
  project            = "fake-test-project"
  location           = "us"
  instance           = "00000000-0000-0000-0000-000000000000"
  reference_list_id  = "compliant_reference_list"
  description        = "A compliant reference list with plain text syntax"

  entries {
    value = "safe-domain.com"
  }

  syntax_type = "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING"
}
