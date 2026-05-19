resource "google_spanner_database" "bad" {
  instance               = "my-instance"
  name                   = "my-database"
  enable_drop_protection = false
}
