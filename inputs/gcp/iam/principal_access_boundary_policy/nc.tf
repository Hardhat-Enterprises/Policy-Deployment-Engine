# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_principal_access_boundary_policy" "nc" {
  organization   = "org-nc"
  location       = "global"
  display_name   = "PAB policy for Organization"
  principal_access_boundary_policy_id = "pab-policy-nc"
  details {
    rules {
      description = "allows access to the following resources"
      resources = [
        "//cloudresourcemanager.googleapis.com/organizations/org-c",
        "//cloudresourcemanager.googleapis.com/folders/123",
        "//cloudresourcemanager.googleapis.com/projects/my-project-id",
        "//cloudresourcemanager.googleapis.com/folders/PRIVATE-NO-OPEN"
      ]
      effect = "ALLOW"
    }
  }
}
