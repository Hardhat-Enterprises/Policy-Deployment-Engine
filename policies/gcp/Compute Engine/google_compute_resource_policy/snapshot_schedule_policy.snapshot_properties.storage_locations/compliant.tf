resource "google_compute_resource_policy" "compliant_example_1" {
  name        = "compliant-example-1"
  region      = "australia-southeast1"
  description = "chain name snapshot"

  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "04:00"
      }
    }

    snapshot_properties {
      storage_locations = ["australia-southeast1"]
    }
  }
}