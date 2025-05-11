# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/123456789012"
  name   = "accessLevels/required-access-levels-c"
  title  = "Required Access Levels Compliant"

  basic {
    combining_function = "AND"

    conditions {
      members = ["domain:deakin.edu.au"]
      required_access_levels = [
        "accessPolicies/123456789012/accessLevels/trusted-device"
      ]
    }
  }
}
