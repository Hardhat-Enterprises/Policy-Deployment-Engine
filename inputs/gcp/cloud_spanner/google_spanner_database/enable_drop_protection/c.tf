resource "google_spanner_database" "c1" {
  instance               = google_spanner_instance.c1.name
  name                   = "c1"
  enable_drop_protection = true
}

resource "google_spanner_instance" "c1" {
  name         = "c1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C1"
  num_nodes    = 1
}
