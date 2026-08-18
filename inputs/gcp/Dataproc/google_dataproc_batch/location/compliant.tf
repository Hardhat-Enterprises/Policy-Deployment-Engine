resource "google_dataproc_batch" "compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  pyspark_batch {
    main_python_file_uri = "gs://test-bucket/main.py"
  }
}
