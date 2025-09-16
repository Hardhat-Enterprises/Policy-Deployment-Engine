# Non-compliant: both org_id and folder_id missing
resource "google_project" "nc123" {
  name                = "nc123"
  project_id          = "proj-ops-production"    # it'll show this id since org_ & folder_id missing
  auto_create_network = false
  deletion_policy     = "PREVENT"
}

# Non-compliant: explicitly nulls (some generators may render nulls)
resource "google_project" "nc223" {
  name                = "nc223"
  project_id          = "proj-app-test"  # it'll show this id since both are null
  org_id              = null
  folder_id           = null
  auto_create_network = false
  deletion_policy     = "PREVENT"
}
