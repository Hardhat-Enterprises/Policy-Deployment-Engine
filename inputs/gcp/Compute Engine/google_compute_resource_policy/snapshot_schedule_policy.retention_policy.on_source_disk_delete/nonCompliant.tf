resource "google_compute_resource_policy" "non-compliant-example-1" {
  name   = "non-compliant-example-1"
  region = "us-central1"
  description = "chain name snapshot"
  snapshot_schedule_policy {
    retention_policy {
      max_retention_days    = 14
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
  }
}