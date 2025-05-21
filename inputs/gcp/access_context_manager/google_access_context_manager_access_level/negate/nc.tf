resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/123456789012"
  name   = "accessLevels/negate-nc"
  title  = "Negate Non-Compliant"

  basic {
    combining_function = "AND"

    conditions {
      members = ["domain:deakin.edu.au"]
      negate  = true
    }
  }
}