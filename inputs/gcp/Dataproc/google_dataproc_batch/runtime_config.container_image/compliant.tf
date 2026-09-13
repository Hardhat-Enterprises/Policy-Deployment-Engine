resource "google_dataproc_batch" "compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class = "org.apache.spark.examples.SparkPi"
  }

  runtime_config {
    container_image = "australia-southeast1-docker.pkg.dev/test-project/repo/spark:1.0"
  }
}
