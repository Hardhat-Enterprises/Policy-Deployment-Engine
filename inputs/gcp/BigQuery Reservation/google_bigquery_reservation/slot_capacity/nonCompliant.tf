resource "google_bigquery_reservation" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  location      = "us-central1"
  slot_capacity = 0
  edition       = "ENTERPRISE"

  ignore_idle_slots = true
  concurrency       = 0

  autoscale { max_slots = 200 }
}
