resource "google_bigquery_reservation" "c" {
  name              = "c"
  project           = "pde-dummy-project"
  location          = "australia-southeast1"
  slot_capacity     = 100
  edition           = "ENTERPRISE"
  ignore_idle_slots = true
}

resource "google_bigquery_reservation_assignment" "c" {
  assignee    = "c"
  job_type    = "QUERY"
  reservation = google_bigquery_reservation.c.id
  location = "australia-southeast1"
}
