resource "google_cloudfunctions_function" "compliant_example_1" {
  name                          = "compliant_example_1"
  runtime                       = "nodejs20"
  region                        = "google_cloudfunctions_function.function.region"
  project                       = "google_cloudfunctions_function.function.project"
  vpc_connector                 = "projects/my-project/locations/australia-southeast1/connectors/my-connector"
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

}
