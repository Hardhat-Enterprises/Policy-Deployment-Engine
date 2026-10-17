resource "google_compute_resource_policy" "compliant_example_1" {
  name        = "compliant-example-1"
  region      = "us-central1"
  description = "chain name snapshot"

  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "04:00"
      }
    }

    retention_policy {
      max_retention_days    = 14
      on_source_disk_delete = "APPLY_RETENTION_POLICY"
    }
  }
}