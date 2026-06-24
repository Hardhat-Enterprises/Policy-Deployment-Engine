resource "google_folder_iam_member" "compliant_example_1" {
  folder = "folders/1234567"
  role   = "roles/viewer" # ✅ safe role
  member = "user:jane@example.com"
}
