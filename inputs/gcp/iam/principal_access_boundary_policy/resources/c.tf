# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_principal_access_boundary_policy" "c" {
  organization   = "org-c"
  location       = "global"
  display_name   = "PAB policy for Organization"
  principal_access_boundary_policy_id = "pab-policy-c"
  details {
    rules {
      description = "allows access to the following resources"
      resources = [
        "//cloudresourcemanager.googleapis.com/folders/folder-id-1"
      ]
      effect = "ALLOW"
    }
  }
}