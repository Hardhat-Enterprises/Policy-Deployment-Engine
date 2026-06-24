resource "google_bigquery_reservation_assignment" "compliant_example_1" {
  assignee    = "projects/pde-dummy-project"
  job_type    = "QUERY"
  reservation = "projects/pde-dummy-project/locations/us-central1/reservations/c"
}
