resource "google_spanner_database" "database" {
  instance = google_spanner_instance.instance.name
  name     = "database"

  enable_drop_protection = false
}

resource "google_spanner_instance" "instance" {
  name         = "test-instance"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance"
  num_nodes    = 1
}
