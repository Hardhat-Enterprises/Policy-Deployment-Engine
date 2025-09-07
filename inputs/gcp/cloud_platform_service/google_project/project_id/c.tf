# Compliant project IDs follow proj-{team}-{env}
resource "google_project" "c1" {
  name       = "Secure Project 1"
  project_id = "proj-app-dev"
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "c2" {
  name       = "Secure Project 2"
  project_id = "proj-sec-prod"
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "c3" {
  name                = "secure project 3"
  project_id          = "proj-app-prod"
  org_id              = "123456789"
  auto_create_network = false
}
