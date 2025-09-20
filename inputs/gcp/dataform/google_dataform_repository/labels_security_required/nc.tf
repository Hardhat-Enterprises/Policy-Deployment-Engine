# Google Dataform Repository — non-compliant labels_security_required (missing/invalid security labels)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"

  labels = {
    security_contact     = ""               # empty → should fail presence check
    data_classification  = "top-secret"     # not in allow-list → should fail value check
    business_criticality = "high"
    compliance_regime    = "none"
  }
}
