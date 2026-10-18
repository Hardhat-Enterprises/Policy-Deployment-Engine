resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_jar_file_uri = "http://example.com/app/main.jar"
  }
}
