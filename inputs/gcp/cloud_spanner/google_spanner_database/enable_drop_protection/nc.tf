resource "google_spanner_database" "nc" {
  instance               = google_spanner_instance.nc.name
  name                   = "nc"
  enable_drop_protection = false
}

resource "google_spanner_instance" "nc" {
  name         = "nc"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC"
  num_nodes    = 1
}
