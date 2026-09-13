resource "google_bigquery_reservation_assignment" "non_compliant_example_1" {
  assignee    = "non_compliant_example_1"
  job_type    = "QUERY"
  reservation = "projects/pde-dummy-project/locations/australia-southeast1/reservations/c"
  location = "us-west2"
}
