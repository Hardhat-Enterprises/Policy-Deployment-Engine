resource "google_folder_iam_binding" "C2" {
  folder  = "folders/1234567"
  role    = "roles/viewer" # ✅ least privilege
  members = ["user:jane@example.com"]
}


