resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent          = "accessPolicies/123456789"
  name            = "accessPolicies/123456789/accessLevels/compliant_deletion"
  title           = "compliant_deletion"
  deletion_policy = "PREVENT"

  basic {
    conditions {
      ip_subnetworks = ["192.168.1.0/24"]
    }
  }
}
