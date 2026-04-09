resource "google_bigquery_routine" "nc" {
  project       = "your-project-id"
  dataset_id    = "nc"
  routine_id    = "your_routine_name"
  routine_type  = "SCALAR_FUNCTION"
  definition_body = "x * 2"
  language      = "SQL"
  data_governance_type = ""

      remote_function_options {
    endpoint = "https://us-east1-my_gcf_project.cloudfunctions.net/remote_add"
    connection = "google_bigquery_connection.test.name"
    max_batching_rows = "10"
    user_defined_context = {
      "z": "1.5",
    }
  }
}