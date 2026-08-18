resource "google_bigquery_routine" "non_compliant_example_1" {
  project         = "your-project-id"
  dataset_id      = "non_compliant_example_1"
  routine_id      = "your_routine_name"
  routine_type    = "SCALAR_FUNCTION"
  definition_body = "x * 2"
  language        = "SQL"

  deletion_policy = "DELETE"
}
