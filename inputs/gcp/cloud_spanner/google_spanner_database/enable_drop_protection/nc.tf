resource "google_spanner_database" "nc1" {
  instance               = google_spanner_instance.nc1.name
  name                   = "nc1"
  enable_drop_protection = false
}

resource "google_spanner_instance" "nc1" {
  name         = "nc1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC1"
  num_nodes    = 1
}
