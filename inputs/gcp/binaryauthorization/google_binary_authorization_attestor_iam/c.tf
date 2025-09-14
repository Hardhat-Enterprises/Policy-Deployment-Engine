resource "google_binary_authorization_attestor_iam_member" "good_iam_member" {
  project  = "my-gcp-project"
  attestor = "projects/my-gcp-project/attestors/good-attestor"

  role   = "roles/containeranalysis.notes.attacher"
  member = "serviceAccount:good-sa@my-gcp-project.iam.gserviceaccount.com"
}
