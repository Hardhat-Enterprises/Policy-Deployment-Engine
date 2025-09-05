resource "google_chronicle_rule" "nc" {
  project   = "fake-project-123"
  location  = "us"
  instance  = "scope-nc"
  scope     = "projects/fake-project-123/locations/eu/instances/scope-nc/dataAccessScopes/legitimatescope"  # Non-compliant scope as location is eu
}
