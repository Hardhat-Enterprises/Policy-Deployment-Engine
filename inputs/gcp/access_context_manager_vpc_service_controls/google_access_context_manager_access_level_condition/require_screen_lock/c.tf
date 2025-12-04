resource "google_access_context_manager_access_level_condition" "c" {
  access_level = google_access_context_manager_access_level.access-level-service-account.name
  device_policy {
    require_screen_lock = true
  }
}