resource "google_chronicle_rule" "compliant_example_1" {
  project  = "fake-project"
  location = "australia-southeast1"
  instance = "compliant_example_1"
  scope    = "projects/fake-project/locations/aus/instances/audit-log-activity/dataAccessScopes/legitimatescope"
}

