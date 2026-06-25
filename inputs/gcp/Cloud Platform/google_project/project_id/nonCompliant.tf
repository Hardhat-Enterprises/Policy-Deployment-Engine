# Non-compliant project IDs do not follow proj-{team}-{env}

resource "google_project" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  project_id = "project-app-dev"   # ❌ missing prefix 'proj-'
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "non_compliant_example_2" {
  name       = "non-compliant-example-2"
  project_id = "proj-ops-staging"  # ❌ env 'staging' not allowed
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "non_compliant_example_3" {
  name                = "non-compliant-example-3"
  project_id          = "myproject-prod-01" # violates proj-*-* pattern
  org_id              = "123456789"
  auto_create_network = false
}
