resource "google_project" "c123" {
  name                = "c123"
  project_id          = "proj-app-prod"
  org_id              = "123456789"
  auto_create_network = false   # ✅ secure
  deletion_policy     = "PREVENT"
}
