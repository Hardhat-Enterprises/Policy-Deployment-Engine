resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  spark_batch {
    main_class = "org.apache.spark.examples.SparkPi"
  }

  runtime_config {
    container_image = "docker.io/library/spark:1.0"
  }
}
