resource "google_binary_authorization_attestor_iam_binding" "good_binding" {
  attestor = "projects/my-secure-project/attestors/good-attestor"
  role     = "roles/containeranalysis.notes.attacher"

  member = [
    "serviceAccount:secure-attestor@my-secure-project.iam.gserviceaccount.com"
  ]
}
