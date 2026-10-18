resource "google_cloudfunctions_function" "non_compliant_example_1" {
  name                         = "non_compliant_example_1"
  runtime                      = "nodejs20"
  region                       = "google_cloudfunctions_function.function.region"
  project                      = "google_cloudfunctions_function.function.project"
  https_trigger_security_level = "SECURE_OPTIONAL"

}
