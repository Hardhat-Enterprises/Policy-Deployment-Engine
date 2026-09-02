data "google_iam_policy" "nc1" {
  binding {
    role = "roles/owner" # ❌ blocked role
    members = ["user:bob@example.com"]
  }
}

resource "google_folder_iam_policy" "non_compliant_example_1" {
  folder      = "folders/1234567"
  policy_data = data.google_iam_policy.nc1.policy_data
}
