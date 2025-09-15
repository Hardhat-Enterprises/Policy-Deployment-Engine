# Non-compliant project IDs do not follow proj-{team}-{env}

resource "google_project" "nc1" {
  name       = "nc123"
  project_id = "project-app-dev"   # ❌ missing prefix 'proj-'
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

resource "google_project" "nc2" {
  name       = "nc223"
  project_id = "proj-ops-staging"  # ❌ env 'staging' not allowed
  org_id     = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"
}


resource "google_project" "nc3" {
  name                = "nc323"
  project_id          = "myproject-prod-01" # violates proj-*-* pattern
  org_id              = "123456789"
  auto_create_network = false
}