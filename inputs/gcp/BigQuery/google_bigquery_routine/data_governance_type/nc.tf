resource "google_bigquery_routine" "nc" {
  project       = "your-project-id"
  dataset_id    = "nc"
  routine_id    = "your_routine_name"
  routine_type  = "SCALAR_FUNCTION"
  definition_body = "x * 2"
  language      = "SQL"
  data_governance_type = ""
}