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
        "//cloudresourcemanager.googleapis.com/organizations/org-c",
        "//cloudresourcemanager.googleapis.com/folders/123",
        "//cloudresourcemanager.googleapis.com/projects/my-project-id"
      ]
      effect = "ALLOW"
    }
    enforcement_version = "latest"
  }
}