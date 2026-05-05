# Healthcare Dataset — encryption_spec attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"

  # VIOLATION: No encryption_spec block — uses Google-managed encryption only (no CMEK)
}
