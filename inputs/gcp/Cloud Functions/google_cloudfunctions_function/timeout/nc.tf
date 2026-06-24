resource "google_cloudfunctions_function" "nc" {
  name    = "nc"
  runtime = "nodejs20"
  region  = "google_cloudfunctions_function.function.region"
  project = "google_cloudfunctions_function.function.project"
  timeout = 20

}