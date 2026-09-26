resource "google_cloudfunctions_function" "non_compliant_example_1" {
  name                          = "non_compliant_example_1"
  runtime                       = "nodejs20"
  region                        = "google_cloudfunctions_function.function.region"
  project                       = "google_cloudfunctions_function.function.project"
  vpc_connector                 = "projects/my-project/locations/australia-southeast1/connectors/my-connector"
  vpc_connector_egress_settings = "ALL_TRAFFIC"

}

