resource "google_access_context_manager_access_policy" "access-policy" {
  parent = "organizations/123456789"
  title  = "my policy"
}

resource "google_access_context_manager_access_level" "access-level-service-account" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/test_level_for_condition"
  title  = "test_level_for_condition"
  basic {
    conditions {
      device_policy {
        require_screen_lock = false
      }
    }
  }
}
resource "google_access_context_manager_access_level_condition" "c" {
  access_level   = google_access_context_manager_access_level.access-level-service-account.name
  ip_subnetworks = ["192.168.1.0/24", "10.0.0.0/8", "8.8.8.8/32"]
}
