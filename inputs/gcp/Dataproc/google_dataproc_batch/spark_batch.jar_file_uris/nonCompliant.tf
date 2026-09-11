resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class    = "org.apache.spark.examples.SparkPi"
    jar_file_uris = ["http://example.com/lib/dependency.jar"]
  }
}