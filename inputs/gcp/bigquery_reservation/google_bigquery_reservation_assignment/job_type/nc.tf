resource "google_bigquery_reservation" "nc" {
  name              = "nc-reservation"
  project           = "pde-dummy-project"
  location          = "us-central1"
  slot_capacity     = 100
  edition           = "ENTERPRISE"
  ignore_idle_slots = true
}

resource "google_bigquery_reservation_assignment" "nc" {
  assignee    = "projects/pde-dummy-project"
  job_type    = "CONTINUOUS"
  reservation = google_bigquery_reservation.nc.id
}
