resource "google_chronicle_reference_list" "noncompliant_list" {
  project            = "fake-test-project"
  location           = "us"
  instance           = "00000000-0000-0000-0000-000000000000"
  reference_list_id  = "noncompliant_reference_list"
  description        = "A non-compliant reference list with disallowed regex syntax"

  entries {
    value = ".*\\.evil\\.com"
  }

  syntax_type = "REFERENCE_LIST_SYNTAX_TYPE_REGEX"
}
