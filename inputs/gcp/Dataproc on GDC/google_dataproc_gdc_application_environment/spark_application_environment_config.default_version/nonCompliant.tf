resource "google_dataproc_gdc_application_environment" "non_compliant_example_1" {
     location        = "us1"
     serviceinstance = "do-not-delete-dataproc-gdc-instance"
     project = 1

     spark_application_environment_config {
       default_version = "0.x"
     }

}
