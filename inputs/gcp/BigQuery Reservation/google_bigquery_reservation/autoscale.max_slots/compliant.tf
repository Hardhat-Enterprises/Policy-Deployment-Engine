resource "google_bigquery_reservation" "compliant_example_1" {
  name          = "compliant_example_1"
  location      = "us-central1"
  slot_capacity = 100
  edition       = "ENTERPRISE"

  ignore_idle_slots = true
  concurrency       = 50

  autoscale {
    max_slots = 200
  }
}
