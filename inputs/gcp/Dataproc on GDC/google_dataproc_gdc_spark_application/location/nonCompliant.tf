resource "google_dataproc_gdc_spark_application" "non_compliant_example_1" {
  location             = "us-central1"
  serviceinstance      = "projects/example/locations/australia-southeast1/serviceInstances/example"
  spark_application_id = "non_compliant_example_1"

  pyspark_application_config {
    main_python_file_uri = "gs://example-bucket/example.py"
  }
}
