resource "google_chronicle_rule" "c" {
  project  = "fake-project"  
  location = "australia-southeast1"
  instance = "c"
  scope    = "projects/fake-project/locations/australia-southeast1/instances/audit-log-activity/dataAccessScopes/legitimatescope"
}

