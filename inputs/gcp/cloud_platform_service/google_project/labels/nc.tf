resource "google_project" "nc" {
  name       = "noncompliant-project"
  project_id = "proj-app-test"
  org_id     = "83838389292"

  // No labels defined
}
