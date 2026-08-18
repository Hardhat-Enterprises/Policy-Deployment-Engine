resource "google_binary_authorization_attestor_iam_member" "non_compliant_example_1" {
  attestor = "projects/my-insecure-project/attestors/bad-attestor"
  role     = "roles/viewer"
  member   = "serviceAccount:invalid-sa@my-insecure-project.iam.gserviceaccount.com"
}
