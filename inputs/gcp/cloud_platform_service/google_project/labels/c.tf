resource "google_project" "c" {
  name       = "compliant-project"
  project_id = "proj-sec-test"
  org_id     = "123456789012"

  labels = {
    owner = "security-team"
    env   = "dev"
    team = "infra"
  }
}
