resource "google_project" "non_compliant_example_1" {
  name                = "non-compliant-example-1"
  project_id          = "proj-sec-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"

  # ❌ missing billing account (null/empty will be flagged)
  billing_account     = null
}
