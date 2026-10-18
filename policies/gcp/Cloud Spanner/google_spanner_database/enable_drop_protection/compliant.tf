resource "google_spanner_database" "compliant_example_1" {
  instance               = "c-instance"
  name                   = "compliant_example_1"
  enable_drop_protection = true
}

