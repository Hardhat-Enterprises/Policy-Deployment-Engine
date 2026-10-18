resource "google_bigquery_routine" "non_compliant_example_1" {
  project         = "your-project-id"
  dataset_id      = "non_compliant_example_1"
  routine_id      = "your_routine_name"
  routine_type    = "PROCEDURE"
  definition_body = "main.py"
  language        = "PYTHON"

  spark_options {
    container_image = "docker.io/library/python:3.12"
  }
}
