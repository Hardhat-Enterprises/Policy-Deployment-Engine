resource "google_access_context_manager_access_level_condition" "non_compliant_example_1" {
  access_level   = "accessPolicies/123456789/accessLevels/test_level_for_condition"
  ip_subnetworks = ["172.16.0.0/12", "0.0.0.0/0", "1.1.1.1/32"]
}
