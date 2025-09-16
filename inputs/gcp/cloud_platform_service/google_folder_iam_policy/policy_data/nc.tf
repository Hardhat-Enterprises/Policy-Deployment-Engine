data "google_iam_policy" "nc1" {
  binding {
    role = "roles/owner" # ❌ blocked role
    members = ["user:bob@example.com"]
  }
}

resource "google_folder_iam_policy" "NC1" {
  folder      = "bad-folders/98098"
  policy_data = data.google_iam_policy.nc1.policy_data
}
