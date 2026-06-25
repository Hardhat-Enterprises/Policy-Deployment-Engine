resource "google_project" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  project_id = "proj-app-test"
  org_id     = "83838389292"

  // No labels defined
}
