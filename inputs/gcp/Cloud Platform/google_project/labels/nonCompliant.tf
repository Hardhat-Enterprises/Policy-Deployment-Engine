resource "google_project" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  project_id = "proj-sec-test"
  org_id     = "123456789012"

  // No labels defined
}
