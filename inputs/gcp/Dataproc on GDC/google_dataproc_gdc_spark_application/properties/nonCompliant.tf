resource "google_dataproc_gdc_spark_application" "non_compliant_example_1" {
  location             = "australia-southeast1"
  serviceinstance      = "projects/example/locations/australia-southeast1/serviceInstances/example"
  spark_application_id = "non_compliant_example_1"

  properties = {
    "spark.authenticate" = "false"
  }

  pyspark_application_config {
    main_python_file_uri = "gs://example-bucket/example.py"
  }
}
