# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/123456789012"
  name   = "accessLevels/compliant-example-c"
  title  = "Compliant Access Level"

  basic {
    combining_function = "AND"

    conditions {
      members = ["domain:deakin.edu.au"]
    }
  }
}

