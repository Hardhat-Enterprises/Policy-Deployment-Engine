resource "google_folder_iam_binding" "non_compliant_example_1" {
  folder  = "folders/1234567"
  role    = "roles/owner" # ❌ forbidden
  members = ["user:bob@example.com"]
}
