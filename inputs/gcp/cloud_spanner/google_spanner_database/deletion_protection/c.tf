resource "google_spanner_database" "good" {
  instance              = "my-instance"
  name                  = "my-database"
  deletion_protection   = true
}
