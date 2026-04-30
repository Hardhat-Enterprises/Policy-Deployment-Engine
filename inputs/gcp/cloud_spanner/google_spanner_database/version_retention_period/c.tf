resource "google_spanner_database" "c1" {
  instance                 = "example-instance"
  name                     = "c1"
  version_retention_period = "7d"
}
