resource "google_bigquery_routine" "nc" {
  project       = "your-project-id"
  dataset_id    = "nc"
  routine_id    = "your_routine_name"
  routine_type  = "SCALAR_FUNCTION"
  definition_body = "x * 2"
  language      = "SQL"
  description   = "A simple function that doubles the input"
  security_mode = "INVOKER"
}