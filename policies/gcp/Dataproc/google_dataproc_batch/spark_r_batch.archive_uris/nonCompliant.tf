resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_r_batch {
    main_r_file_uri = "gs://trusted-bucket/main.R"
    archive_uris    = ["http://example.com/deps/archive.tar.gz"]
  }
}
