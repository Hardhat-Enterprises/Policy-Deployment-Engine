# Non-compliant: explicitly nulls (some generators may render nulls)
resource "google_project" "nc" {
  name                = "nc223"
  project_id          = "nc" # it'll show this id since both are null
  org_id              = null
  folder_id           = null
  auto_create_network = false
  deletion_policy     = "PREVENT"
}
