resource "google_scc_source_iam_binding" "non_compliant_example_1" {
  organization = "non_compliant_example_1"
  source       = "2001"
  role         = "roles/owner"
  members      = ["allAuthenticatedUsers"]
}
