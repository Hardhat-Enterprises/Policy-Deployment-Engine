resource "google_scc_source_iam_binding" "nc" {
  organization = "nc"
  source       = "5678"
  role         = "roles/securitycenter.findingsViewer"

  members = [
    "allAuthenticatedUsers",
    "allUsers"
  ]
}
