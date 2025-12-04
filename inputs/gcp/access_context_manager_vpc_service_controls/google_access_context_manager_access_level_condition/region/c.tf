resource "google_access_context_manager_access_level_condition" "c" {
  access_level = google_access_context_manager_access_level.access-level-service-account.name
  regions = [
    "australia-southeast1","australia-southeast2",
  ]
}