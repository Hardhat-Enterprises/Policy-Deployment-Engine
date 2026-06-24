resource "google_cloudfunctions_function" "nc" {
  name    = "nc"
  runtime = "Node.js10"
  region  = "google_cloudfunctions_function.function.region"
  project = "google_cloudfunctions_function.function.project"

}