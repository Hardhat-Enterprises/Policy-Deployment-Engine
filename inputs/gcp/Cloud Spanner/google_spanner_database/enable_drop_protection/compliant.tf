resource "google_spanner_database" "compliant_example_1" {
  instance               = "c-instance"
  name                   = "c-database"
  enable_drop_protection = true
}

