resource "google_dataproc_metastore_service" "nc" {
  service_id = "nc"
  port       = 8080
  tier       = "DEVELOPER"
  project    = "1"

  maintenance_window {
    hour_of_day = 2
    day_of_week = "SUNDAY"
  }

  hive_metastore_config {
    version = "2.3.6"
  }

  labels = {
    env = "test"
  }
}