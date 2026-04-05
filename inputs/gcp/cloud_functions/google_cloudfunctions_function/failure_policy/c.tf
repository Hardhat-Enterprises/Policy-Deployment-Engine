resource "google_cloudfunctions_function" "c" {
    name = "student"
    runtime = "nodejs20"
    available_memory_mb = "256"
    region = "google_cloudfunctions_function.function.region"
    project = "google_cloudfunctions_function.function.project"

event_trigger {
  event_type = "google.storage.object.finalize"
  resource = "projects/my-project/topics/my-topic"
  failure_policy {
    retry = "true"
  }
}
}