resource "google_spanner_database" "nc1" {
  instance                 = "example-instance"
  name                     = "nc1"
  version_retention_period = ""
}
