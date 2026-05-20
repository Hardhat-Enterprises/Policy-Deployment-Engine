resource "google_spanner_database" "database" {
  instance               = "my-instance"
  name                   = "my-database"
  enable_drop_protection = true
}
