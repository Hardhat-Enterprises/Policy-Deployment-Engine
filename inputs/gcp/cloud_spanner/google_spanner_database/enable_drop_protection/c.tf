resource "google_spanner_database" "c1" {
  instance               = "example-instance"
  name                   = "c1"
  enable_drop_protection = true
}
