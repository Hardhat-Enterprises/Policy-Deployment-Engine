resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/123456789012"
  name   = "accessLevels/members-nc"
  title  = "Members Non-Compliant"

  basic {
    combining_function = "AND"

    conditions {
      members = ["allUsers"]
    }
  }
}