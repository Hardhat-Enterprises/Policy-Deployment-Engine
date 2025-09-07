resource "google_project" "nc" {
  name                = "insecure-project"
  project_id          = "proj-sec-dev"
  org_id              = "123456789"
  auto_create_network = true    # ❌ insecure
  deletion_policy     = "PREVENT"
}
