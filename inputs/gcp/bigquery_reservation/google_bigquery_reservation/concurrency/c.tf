resource "google_bigquery_reservation" "c" {
  name          = "c"
  location      = "us-central1"
  slot_capacity = 100
  edition       = "ENTERPRISE"

  ignore_idle_slots = true
  concurrency       = 50

  autoscale {
    max_slots = 200
  }
}
