resource "google_spanner_database" "bad" {
  instance            = "my-instance"
  name                = "my-database"
  deletion_protection = false
}
