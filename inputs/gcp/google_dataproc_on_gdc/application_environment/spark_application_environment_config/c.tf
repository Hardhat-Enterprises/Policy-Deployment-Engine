resource "google_dataproc_gdc_application_environment" "c" {
     location        = "australia-southeast1"
     serviceinstance = "do-not-delete-dataproc-gdc-instance"
     project = 1

     spark_application_environment_config {
       default_version = "2.2.x"
     }

}
