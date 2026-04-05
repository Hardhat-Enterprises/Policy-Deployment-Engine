resource "google_cloudfunctions_function" "nc" {
    name = "student"
    runtime = "nodejs20"
    available_memory_mb = "4444"
    region = "google_cloudfunctions_function.function.region"
    project = "google_cloudfunctions_function.function.project"

event_trigger {
  event_type = "google.storage.object.finalize"
  resource = "projects/my-project/topics/my-topic"
  failure_policy {
    retry = "false"
  }
}
  
}