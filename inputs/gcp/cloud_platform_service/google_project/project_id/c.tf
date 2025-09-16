# Compliant project IDs follow proj-{team}-{env}
resource "google_project" "c123" {
  name       = "c123"
  project_id = "proj-app-dev"
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "c223" {
  name       = "c223"
  project_id = "proj-sec-prod"
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "c323" {
  name                = "c323"
  project_id          = "proj-app-prod"
  org_id              = "123456789"
  auto_create_network = false
}
