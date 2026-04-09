# Compliant: org_id set
resource "google_project" "c" {
  name                = "c123"
  project_id          = "c"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}
