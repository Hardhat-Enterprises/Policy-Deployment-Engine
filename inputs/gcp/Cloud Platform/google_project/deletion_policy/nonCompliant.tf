resource "google_project" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  project_id          = "proj-sec-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "DELETE"   # ❌ not allowed
}

resource "google_project" "non_compliant_example_2" {
  name                = "non_compliant_example_2"
  project_id          = "proj-ops-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "DELETE"   # ❌ not allowed
}
