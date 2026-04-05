resource "google_cloudfunctions_function" "nc"{
    name = "student"
    runtime = "nodejs20"
    region = "google_cloudfunctions_function.function.region"
    project = "google_cloudfunctions_function.function.project"
    vpc_connector = "projects/my-project/locations/us-central1/connectors/my-connector"
    vpc_connector_egress_settings = "ALL_TRAFFIC"
  
}

