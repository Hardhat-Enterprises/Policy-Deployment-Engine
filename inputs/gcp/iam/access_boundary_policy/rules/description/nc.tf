# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_access_boundary_policy" "nc" {
    name = "abp-nc"
    parent = ""
    rules {
      description = ""
      access_boundary_rule {
        available_resource = ""
        available_permissions = [""]
        availability_condition {
          expression = ""
          title = ""
          description = ""
          location = ""
        }
      }
    }
    display_name = ""
}