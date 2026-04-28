resource "google_access_context_manager_access_level_condition" "nc" {
  access_level   = google_access_context_manager_access_level.access-level-service-account.name
  ip_subnetworks = ["172.16.0.0/12", "0.0.0.0/0", "1.1.1.1/32"]
}