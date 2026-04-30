resource "google_spanner_database" "c1" {
  instance          = "example-instance"
  name              = "c1"
  default_time_zone = "UTC"
}
