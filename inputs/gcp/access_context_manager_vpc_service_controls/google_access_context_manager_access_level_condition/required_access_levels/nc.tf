resource "google_access_context_manager_access_level_condition" "nc" {
  access_level           = google_access_context_manager_access_level.access-level-service-account.name
  required_access_levels = ["accessPolicies/123456789/accessLevels/nc"]
}
