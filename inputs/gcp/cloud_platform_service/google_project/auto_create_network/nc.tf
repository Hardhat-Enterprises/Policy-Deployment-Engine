resource "google_project" "nc123" {
  name                = "nc123"
  project_id          = "proj-sec-dev"
  org_id              = "123456789"
  auto_create_network = true    # ❌ insecure
  deletion_policy     = "PREVENT"
}
