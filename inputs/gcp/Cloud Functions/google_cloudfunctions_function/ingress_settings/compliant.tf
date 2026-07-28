resource "google_cloudfunctions_function" "compliant_example_1" {
  name             = "compliant_example_1"
  runtime          = "nodejs20"
  region           = "google_cloudfunctions_function.function.region"
  project          = "google_cloudfunctions_function.function.project"
  ingress_settings = "ALLOW_INTERNAL_ONLY"

}
