resource "google_access_context_manager_access_level_condition" "compliant_example_1" {
  access_level   = "accessPolicies/123456789/accessLevels/test_level_for_condition"
  ip_subnetworks = ["192.168.1.0/24", "10.0.0.0/8", "8.8.8.8/32"]
}
