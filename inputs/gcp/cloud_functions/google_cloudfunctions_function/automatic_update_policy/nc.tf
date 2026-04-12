resource "google_cloudfunctions_function" "nc" {
  name                = "nc"
  runtime             = "nodejs20"
  available_memory_mb = "4444"
  region              = "google_cloudfunctions_function.function.region"
  project             = "google_cloudfunctions_function.function.project"
}