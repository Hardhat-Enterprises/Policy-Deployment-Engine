resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class = "org.apache.spark.examples.SparkPi"
    file_uris  = ["http://example.com/conf/app.conf"]
  }
}
