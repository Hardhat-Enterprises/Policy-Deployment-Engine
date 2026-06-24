resource "google_project" "compliant_example_1" {
  name       = "compliant_example_1"
  project_id = "proj-sec-test"
  org_id     = "123456789012"

  labels = {
    owner = "security-team"
    env   = "dev"
    team = "infra"
  }
}
