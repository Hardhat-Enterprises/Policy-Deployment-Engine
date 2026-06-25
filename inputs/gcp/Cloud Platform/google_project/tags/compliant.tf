resource "google_project" "compliant_example_1" {
  name                = "compliant-example-1"
  project_id          = "proj-app-dev"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"

  # ✅ required env tag present with allowed value
  tags = {
    "tagKeys/env" = "tagValues/dev"
  }
}
