resource "google_bigquery_reservation_assignment" "non_compliant_example_1" {
  assignee    = "non_compliant_example_1"
  job_type    = "JOB_TYPE_UNSPECIFIED"
  reservation = "projects/pde-dummy-project/locations/us-central1/reservations/nc"
}
