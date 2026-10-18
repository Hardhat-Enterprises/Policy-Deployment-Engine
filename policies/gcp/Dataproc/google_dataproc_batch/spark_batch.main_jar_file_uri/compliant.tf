resource "google_dataproc_batch" "compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_jar_file_uri = "gs://trusted-bucket/app/main.jar"
  }
}
