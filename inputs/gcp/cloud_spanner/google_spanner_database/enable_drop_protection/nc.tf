resource "google_spanner_database" "database_nc" {
  instance = google_spanner_instance.instance_nc.name
  name     = "database-nc"

  enable_drop_protection = false
}

resource "google_spanner_instance" "instance_nc" {
  name         = "test-instance-nc"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC"
  num_nodes    = 1
}
