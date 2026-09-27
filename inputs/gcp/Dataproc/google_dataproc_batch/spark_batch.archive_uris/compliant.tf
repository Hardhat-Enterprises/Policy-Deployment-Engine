resource "google_dataproc_batch" "compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class   = "org.apache.spark.examples.SparkPi"
    archive_uris = ["gs://trusted-bucket/deps/archive.tar.gz"]
  }
}
