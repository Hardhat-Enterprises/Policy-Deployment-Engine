data "google_iam_policy" "admin" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloudfunctions2_function_iam_policy" "c" {
  project = "c"
  location = "us-central1"
  cloud_function = "google_cloudfunctions2_function_01"
  policy_data = data.google_iam_policy.admin.policy_data
}