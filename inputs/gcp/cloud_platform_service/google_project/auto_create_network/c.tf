resource "google_project" "c" {
  name                = "secure-project"
  project_id          = "proj-app-prod"
  org_id              = "123456789"
  auto_create_network = false   # ✅ secure
  deletion_policy     = "PREVENT"
}
