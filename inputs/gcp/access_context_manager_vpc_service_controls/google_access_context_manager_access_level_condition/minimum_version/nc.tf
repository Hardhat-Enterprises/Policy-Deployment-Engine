resource "google_access_context_manager_access_level_condition" "nc" {
  access_level = google_access_context_manager_access_level.access-level-service-account.name
  device_policy {
    os_constraints {
      os_type         = "DESKTOP_CHROME_OS"
      minimum_version = "9.0.0"
    }
  }
}
