resource "google_spanner_database" "non_compliant_example_1" {
  instance               = "nc"
  name                   = "non_compliant_example_1"
  enable_drop_protection = false
}

