resource "google_spanner_backup" "nc1" {
  instance    = google_spanner_instance.nc1_instance.name
  database    = google_spanner_database.nc1_database.name
  name        = "nc1-backup"
  expire_time = "2025-12-31T00:00:00Z"

  encryption_config {
    encryption_type = "USE_DATABASE_ENCRYPTION"
  }
}

resource "google_spanner_instance" "nc1_instance" {
  name         = "test-instance-nc1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC1"
  num_nodes    = 1
}

resource "google_spanner_database" "nc1_database" {
  instance = google_spanner_instance.nc1_instance.name
  name     = "nc1-database"
}
