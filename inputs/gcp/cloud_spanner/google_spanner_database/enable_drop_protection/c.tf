resource "google_spanner_database" "good" {
  instance               = "my-instance"
  name                   = "my-database"
  enable_drop_protection = true
}
