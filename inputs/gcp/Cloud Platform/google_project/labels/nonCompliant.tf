resource "google_project" "non_compliant_example_1" {
  name       = "non_compliant_example_1"
  project_id = "proj-app-test"
  org_id     = "83838389292"

  // No labels defined
}
