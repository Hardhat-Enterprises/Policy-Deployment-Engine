resource "google_chronicle_rule" "non_compliant_example_1" {
  project  = "fake-project"
  location = "south-africa"
  instance = "non_compliant_example_1"
  scope    = "projects/fake-project/locations/south-africa/instances/audit-log-activity/dataAccessScopes/legitimatescope"
}
