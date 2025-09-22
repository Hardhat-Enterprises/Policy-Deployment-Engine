# Google Dataform Repository — compliant labels_security_required (all security labels set with allowed values)

resource "google_dataform_repository" "c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "c"
  display_name = "c"

  labels = {
    security_contact     = "sec-oncall@example.com"
    data_classification  = "confidential"
    business_criticality = "high"
    compliance_regime    = "hipaa"
  }
}
