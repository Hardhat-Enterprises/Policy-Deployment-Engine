# Compliant Firebase Function deployed in approved region
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloudfunctions_function" "c" {
  name    = "approved-function"
  region  = "us-central1"
  runtime = "nodejs18"
  project = "mock-project"
  # The following attributes are required for the resource but are not relevant for the policy check
  available_memory_mb   = 128
  source_archive_bucket = "mock-bucket"
  source_archive_object = "mock-object"
  trigger_http          = true
  entry_point           = "handler"
}
