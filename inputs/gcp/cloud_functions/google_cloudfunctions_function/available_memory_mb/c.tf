resource "google_cloudfunctions_function" "c" {
  name                = "c"
  runtime             = "nodejs20"
  available_memory_mb = "256"
  region              = "google_cloudfunctions_function.function.region"
  project             = "google_cloudfunctions_function.function.project"

}