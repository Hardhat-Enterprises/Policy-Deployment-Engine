data "google_iam_policy" "c1" {
  binding {
    role = "roles/viewer"
    members = ["user:jane@example.com"]
  }
}

resource "google_folder_iam_policy" "C1" {
  folder      = "folders/1234567"
  policy_data = data.google_iam_policy.c1.policy_data
}
