# Google Dataform Repository — non-compliant labels_security_required (missing/invalid security labels)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"

  labels = {
    security_contact     = "security-team@example.com"  # <-- fixed: added valid security contact
    data_classification  = "restricted"                 # <-- fixed: changed to valid value from allow-list
    business_criticality = "high"
    compliance_regime    = "none"
  }
}
