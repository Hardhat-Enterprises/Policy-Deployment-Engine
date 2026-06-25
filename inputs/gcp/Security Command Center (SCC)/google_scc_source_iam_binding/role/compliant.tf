resource "google_scc_source_iam_binding" "compliant_example_1" {
  organization = "compliant_example_1"
  source       = "5678"
  role         = "roles/securitycenter.findingsEditor"
  members      = [
    "group:secops@deakin.edu.au"
  ]
}
