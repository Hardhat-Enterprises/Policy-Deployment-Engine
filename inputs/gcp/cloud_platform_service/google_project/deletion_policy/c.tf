resource "google_project" "c" {
  name                = "protected-project"
  project_id          = "proj-app-dev"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"  # ✅ required
}