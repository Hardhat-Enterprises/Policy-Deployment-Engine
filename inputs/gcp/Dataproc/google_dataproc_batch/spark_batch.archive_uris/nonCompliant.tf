resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class   = "org.apache.spark.examples.SparkPi"
    archive_uris = ["http://example.com/deps/archive.tar.gz"]
  }
}
