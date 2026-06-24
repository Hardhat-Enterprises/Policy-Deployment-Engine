resource "google_cloudfunctions_function" "c" {
  name                          = "c"
  runtime                       = "nodejs20"
  region                        = "google_cloudfunctions_function.function.region"
  project                       = "google_cloudfunctions_function.function.project"
  vpc_connector                 = "projects/my-project/locations/australia-southeast1/connectors/my-connector"
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

}