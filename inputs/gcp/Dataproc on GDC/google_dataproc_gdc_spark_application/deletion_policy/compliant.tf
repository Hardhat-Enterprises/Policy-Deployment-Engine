resource "google_dataproc_gdc_spark_application" "compliant_example_1" {
  location             = "australia-southeast1"
  serviceinstance      = "projects/example/locations/australia-southeast1/serviceInstances/example"
  spark_application_id = "compliant_example_1"
  deletion_policy      = "PREVENT"

  pyspark_application_config {
    main_python_file_uri = "gs://example-bucket/example.py"
  }
}
