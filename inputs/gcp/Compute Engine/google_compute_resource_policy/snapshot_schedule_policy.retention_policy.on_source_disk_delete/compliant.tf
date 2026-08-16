resource "google_compute_resource_policy" "compliant-example-1" {
  name   = "compliant-example-1"
  region = "us-central1"
  description = "chain name snapshot"
  snapshot_schedule_policy {
    retention_policy {
      max_retention_days    = 14
      on_source_disk_delete = "APPLY_RETENTION_POLICY"
    }
  }
}