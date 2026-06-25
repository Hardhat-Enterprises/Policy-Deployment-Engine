resource "google_dataproc_metastore_service" "compliant_example_1" {
  service_id = "compliant_example_1"
  port       = 9083
  tier       = "DEVELOPER"
  project = "1"

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
