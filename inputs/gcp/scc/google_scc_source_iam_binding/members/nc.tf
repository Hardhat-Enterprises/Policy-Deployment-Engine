resource "google_scc_source_iam_binding" "nc" {
  organization = "nc"
  source       = "2001"
  role         = "roles/securitycenter.findingsViewer"

  members = [
    "allAuthenticatedUsers",
    "allUsers"
  ]
}
