resource "google_project" "non_compliant_example_1" {
  name                = "non-compliant-example-1"
  project_id          = "proj-app-dev"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "DELETE"   # ❌ not allowed
}

resource "google_project" "non_compliant_example_2" {
  name                = "non-compliant-example-2"
  project_id          = "proj-app-dev"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "DELETE"   # ❌ not allowed
}
