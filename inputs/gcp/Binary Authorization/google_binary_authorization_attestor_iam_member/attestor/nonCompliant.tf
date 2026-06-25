resource "google_binary_authorization_attestor_iam_member" "non_compliant_example_1" {
  attestor = "projects/my-secure-project/attestors/invalid-reference"
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:bad-sa@my-secure-project.iam.gserviceaccount.com"
}
