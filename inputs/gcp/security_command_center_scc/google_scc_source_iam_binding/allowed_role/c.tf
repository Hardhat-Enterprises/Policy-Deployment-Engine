resource "google_scc_source_iam_binding" "c" {
  organization = "c"
  source       = "5678"
  role         = "roles/securitycenter.findingsEditor"
  members      = [
    "group:secops@deakin.edu.au"
  ]
}
