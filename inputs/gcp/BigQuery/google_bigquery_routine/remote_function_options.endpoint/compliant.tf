resource "google_bigquery_routine" "compliant_example_1" {
  project         = "your-project-id"
  dataset_id      = "compliant_example_1"
  routine_id      = "your_routine_name"
  routine_type    = "SCALAR_FUNCTION"
  definition_body = "x * 2"
  language        = "SQL"

  remote_function_options {
    endpoint          = "https://australia-southeast1-my_gcf_project.cloudfunctions.net/remote_add"
    connection        = "google_bigquery_connection.test.name"
    max_batching_rows = "10"

    user_defined_context = {
      "z" = "1.5"
    }
  }
}
