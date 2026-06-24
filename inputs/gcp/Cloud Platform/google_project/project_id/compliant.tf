# Compliant project IDs follow proj-{team}-{env}
resource "google_project" "compliant_example_1" {
  name       = "compliant_example_1"
  project_id = "proj-app-dev"
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "compliant_example_2" {
  name       = "compliant_example_2"
  project_id = "proj-sec-prod"
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "compliant_example_3" {
  name                = "compliant_example_3"
  project_id          = "proj-app-prod"
  org_id              = "123456789"
  auto_create_network = false
}
