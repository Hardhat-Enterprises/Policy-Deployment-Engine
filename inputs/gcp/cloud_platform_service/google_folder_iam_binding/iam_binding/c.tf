resource "google_folder_iam_binding" "C1" {
  folder  = "folders/1234567"
  role    = "roles/viewer" # ✅ least privilege
  members = ["user:jane@example.com"]
}


