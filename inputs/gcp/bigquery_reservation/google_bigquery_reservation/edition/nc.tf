resource "google_bigquery_reservation" "nc" {
  name          = "nc"
  location      = "us-central1"
  slot_capacity = 100
  edition       = "STANDARD" 

  ignore_idle_slots = true
  concurrency       = 0

  autoscale {
    max_slots = 200
  }
}
