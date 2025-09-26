resource "google_project" "nc123" {
  name                = "nc123"
  project_id          = "proj-sec-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "DELETE"   # ❌ not allowed
}

resource "google_project" "nc223" {
  name                = "nc223"
  project_id          = "proj-ops-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "DELETE"   # ❌ not allowed
}