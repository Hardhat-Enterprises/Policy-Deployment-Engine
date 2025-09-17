# Compliant: org_id set
resource "google_project" "c123" {
  name                = "c123"
  project_id          = "proj-app-dev"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

# Compliant: folder_id set (org_id omitted)
resource "google_project" "c223" {
  name                = "c223"
  project_id          = "proj-sec-test"
  folder_id           = "987654321"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}
