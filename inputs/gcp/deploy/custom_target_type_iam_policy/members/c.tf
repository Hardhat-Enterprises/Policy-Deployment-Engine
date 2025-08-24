# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_custom_target_type_iam_policy" "c" {
  name        = "test-custom-target-type-c"
  policy_data = data.google_iam_policy.compliant.policy_data
}

data "google_iam_policy" "compliant" {
  binding {
    role = "roles/viewer"
    members = [
      "user:developer@yourcompany.com",
      "serviceAccount:deploy-sa@project.iam.gserviceaccount.com",
      "group:deploy-team@yourcompany.com",
    ]
  }
}