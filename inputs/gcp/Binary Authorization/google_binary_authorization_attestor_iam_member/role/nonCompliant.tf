resource "google_binary_authorization_attestor_iam_member" "non_compliant_example_1" {
  attestor = "projects/my-secure-project/attestors/good-attestor"
  role     = "roles/viewer"
  member   = "serviceAccount:valid-sa@my-secure-project.iam.gserviceaccount.com"
}
