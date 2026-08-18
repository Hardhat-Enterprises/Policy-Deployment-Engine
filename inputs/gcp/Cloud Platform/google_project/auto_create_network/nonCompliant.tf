resource "google_project" "non_compliant_example_1" {
  name                = "non-compliant-example-1"
  project_id          = "proj-sec-dev"
  org_id              = "123456789"
  auto_create_network = true    # ❌ insecure
  deletion_policy     = "PREVENT"
}
