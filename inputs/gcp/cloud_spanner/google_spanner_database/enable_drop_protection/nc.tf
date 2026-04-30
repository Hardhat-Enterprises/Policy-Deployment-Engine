resource "google_spanner_database" "nc1" {
  instance               = "example-instance"
  name                   = "nc1"
  enable_drop_protection = false
}
