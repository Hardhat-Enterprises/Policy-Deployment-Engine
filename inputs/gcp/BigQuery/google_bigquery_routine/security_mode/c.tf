resource "google_bigquery_routine" "c" {
  project         = "your-project-id"
  dataset_id      = "c"
  routine_id      = "your_routine_name"
  routine_type    = "SCALAR_FUNCTION"
  definition_body = "x * 2"
  language        = "SQL"
  security_mode   = "DEFINER"
}