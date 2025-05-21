resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/123456789012"
  name   = "accessLevels/members-c"
  title  = "Members Compliant"

  basic {
    combining_function = "AND"

    conditions {
      members = ["domain:deakin.edu.au"]
    }
  }
}
