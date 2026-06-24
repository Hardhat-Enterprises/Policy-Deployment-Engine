resource "google_project" "nc123" {
  name                = "nc123"
  project_id          = "proj-sec-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"

  # ❌ missing billing account (null/empty will be flagged)
  billing_account     = null
}
