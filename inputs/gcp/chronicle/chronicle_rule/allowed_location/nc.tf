resource "google_chronicle_rule" "nc" {
  project  = "fake-project"  
  location = "india"
  instance = "nc"
  scope    = "projects/fake-project/locations/aus/instances/audit-log-activity/dataAccessScopes/legitimatescope"
}
