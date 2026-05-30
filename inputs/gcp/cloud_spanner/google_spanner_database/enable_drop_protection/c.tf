resource "google_spanner_database" "c" {
  instance               = google_spanner_instance.c.name
  name                   = "c-database"
  enable_drop_protection = true
}

resource "google_spanner_instance" "c" {
  name         = "c-instance"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C"
  num_nodes    = 1
}
