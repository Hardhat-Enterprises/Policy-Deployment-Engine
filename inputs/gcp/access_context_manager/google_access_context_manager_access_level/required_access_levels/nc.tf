resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/123456789012"
  name   = "accessLevels/required-access-levels-nc"
  title  = "Required Access Levels Non-Compliant"

  basic {
    combining_function = "AND"

    conditions {
      members = ["domain:deakin.edu.au"]
      required_access_levels = [
        "accessPolicies/123456789012/accessLevels/low-trust"
      ]
    }
  }
}