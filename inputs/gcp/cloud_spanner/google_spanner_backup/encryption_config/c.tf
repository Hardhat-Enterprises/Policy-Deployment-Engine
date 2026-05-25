resource "google_spanner_backup" "c1" {
  instance        = google_spanner_instance.c1_instance.name
  database        = google_spanner_database.c1_database.name
  name            = "c1-backup"
  expire_time     = "2025-12-31T00:00:00Z"

  encryption_config {
    encryption_type = "CUSTOMER_MANAGED_ENCRYPTION"
    kms_key_name    = "projects/my-project/locations/australia-southeast1/keyRings/my-ring/cryptoKeys/my-key"
  }
}

resource "google_spanner_instance" "c1_instance" {
  name         = "test-instance-c1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C1"
  num_nodes    = 1
}

resource "google_spanner_database" "c1_database" {
  instance = google_spanner_instance.c1_instance.name
  name     = "c1-database"
}
