resource "google_spanner_database" "c" {
  instance               = google_spanner_instance.c.name
  name                   = "c"
  enable_drop_protection = true
}

resource "google_spanner_instance" "c" {
  name         = "c"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C"
  num_nodes    = 1
}
