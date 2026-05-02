resource "google_access_context_manager_access_level_condition" "c" {
  access_level   = google_access_context_manager_access_level.access-level-service-account.name
  ip_subnetworks = ["192.168.1.0/24", "10.0.0.0/8", "8.8.8.8/32"]
}
