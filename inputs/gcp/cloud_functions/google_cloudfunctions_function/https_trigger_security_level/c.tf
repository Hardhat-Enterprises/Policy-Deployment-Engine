resource "google_cloudfunctions_function" "c" {
    name = "student"
    runtime = "nodejs20"
    region = "google_cloudfunctions_function.function.region"
    project = "google_cloudfunctions_function.function.project"
    https_trigger_security_level = "SECURE_ALWAYS"
  
}