resource "google_dataproc_batch" "compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class = "org.apache.spark.examples.SparkPi"
    file_uris  = ["gs://trusted-bucket/conf/app.conf"]
  }
}
