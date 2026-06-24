resource "google_bigquery_reservation_assignment" "compliant_example_1" {
  assignee    = "compliant_example_1"
  job_type    = "QUERY"
  reservation = "projects/pde-dummy-project/locations/australia-southeast1/reservations/c"
  location = "australia-southeast1"
}
