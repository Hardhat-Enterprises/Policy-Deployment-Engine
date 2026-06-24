resource "google_access_context_manager_access_level_condition" "non_compliant_example_1" {
  access_level = google_access_context_manager_access_level.access-level-service-account.name
  members      = ["user:hacker@example.com"]
}
