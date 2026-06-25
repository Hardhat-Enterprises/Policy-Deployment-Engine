resource "google_project" "compliant_example_1" {
  name                = "compliant-example-1"
  project_id          = "proj-app-prod"
  org_id              = "123456789"
  auto_create_network = false   # ✅ secure
  deletion_policy     = "PREVENT"
}
