# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dataproc_gdc_spark_application" "c" {
  spark_application_id = "tf-e2e-spark-app-basic"
  serviceinstance      = "do-not-delete-dataproc-gdc-instance"
  location             = "us-west2"


}


