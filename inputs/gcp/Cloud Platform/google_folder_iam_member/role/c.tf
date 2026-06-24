resource "google_folder_iam_member" "C3" {
  folder = "folders/1234567"
  role   = "roles/viewer" # ✅ safe role
  member = "user:jane@example.com"
}
