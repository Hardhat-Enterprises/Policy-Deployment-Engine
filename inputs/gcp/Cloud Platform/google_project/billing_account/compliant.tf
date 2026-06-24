resource "google_project" "compliant_example_1" {
  name                = "compliant_example_1"
  project_id          = "proj-app-dev"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"

  # ✅ valid billing account attached
  billing_account     = "000000-000000-000000"
}
