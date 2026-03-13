resource "google_bigquery_reservation" "nc" {
  name              = "nc"
  project           = "pde-dummy-project"
  location          = "us-central1"
  slot_capacity     = 100
  edition           = "ENTERPRISE"
  ignore_idle_slots = true
}

resource "google_bigquery_reservation_assignment" "nc" {
  assignee    = "nc"
  job_type    = "JOB_TYPE_UNSPECIFIED"
  reservation = google_bigquery_reservation.nc.id
}
