resource "google_binary_authorization_attestor_iam_member" "non_compliant_example_1" {
  attestor = "projects/my-secure-project/attestors/attestor1"
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:hacker-sa@evil-project.iam.gserviceaccount.com"
}
