resource "google_folder_iam_member" "NC1" {
  folder = "folders/1234567"
  role   = "roles/editor" # ❌ blocked
  member = "user:bob@example.com"
}

resource "google_folder_iam_member" "NC2" {
  folder = "folders/1234567"
  role   = "roles/owner" # ❌ blocked
  member = "user:jessica@example.com"
}