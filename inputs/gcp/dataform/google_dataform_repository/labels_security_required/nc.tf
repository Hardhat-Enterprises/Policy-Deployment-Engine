# Google Dataform Repository — non-compliant labels_security_required (missing/invalid security labels)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"

  labels = {
    security_contact     = ""              # Empty string - non-compliant for testing policy enforcement
    data_classification  = "invalid_value" # Invalid value - non-compliant for testing policy enforcement
    business_criticality = "high"
    compliance_regime    = "none"
  }
}
