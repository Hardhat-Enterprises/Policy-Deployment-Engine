resource "google_bigquery_routine" "compliant_example_1" {
  project         = "your-project-id"
  dataset_id      = "compliant_example_1"
  routine_id      = "your_routine_name"
  routine_type    = "PROCEDURE"
  definition_body = "main.py"
  language        = "PYTHON"

  spark_options {
    container_image = "australia-southeast1-docker.pkg.dev/your-project/approved-repo/spark-image:latest"
  }
}
