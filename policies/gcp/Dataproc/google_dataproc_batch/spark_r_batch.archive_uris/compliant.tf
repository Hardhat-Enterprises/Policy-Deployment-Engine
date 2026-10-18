resource "google_dataproc_batch" "compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_r_batch {
    main_r_file_uri = "gs://trusted-bucket/main.R"
    archive_uris    = ["gs://trusted-bucket/deps/archive.tar.gz"]
  }
}
