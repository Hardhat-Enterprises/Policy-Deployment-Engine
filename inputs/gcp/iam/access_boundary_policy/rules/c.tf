# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_access_boundary_policy" "c" {
    name = "abp-c"
    parent = ""
    rules {
      description = ""
      access_boundary_rule {
        available_resource = "*"
        available_permissions = []
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
