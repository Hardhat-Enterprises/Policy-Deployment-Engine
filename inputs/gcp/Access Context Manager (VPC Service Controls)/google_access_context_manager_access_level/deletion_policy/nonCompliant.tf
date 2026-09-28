resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent          = "accessPolicies/123456789"
  name            = "accessPolicies/123456789/accessLevels/non_compliant_deletion"
  title           = "non_compliant_deletion"
  deletion_policy = "DELETE"

  basic {
    conditions {
      ip_subnetworks = ["192.168.1.0/24"]
    }
  }
}
