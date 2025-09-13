resource "google_chronicle_rule" "nc" {
  project   = "fake-project"
  location  = "south-africa"
  instance  = "nc"
  scope     = "projects/fake-project/locations/south-africa/instances/audit-log-activity/dataAccessScopes/legitimatescope"
}
