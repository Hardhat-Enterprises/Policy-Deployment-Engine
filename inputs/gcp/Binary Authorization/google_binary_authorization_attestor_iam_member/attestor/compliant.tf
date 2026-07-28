resource "google_binary_authorization_attestor_iam_member" "compliant_example_1" {
  attestor = "projects/my-secure-project/attestors/australia-southeast1"
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:valid-sa@my-secure-project.iam.gserviceaccount.com"
}
