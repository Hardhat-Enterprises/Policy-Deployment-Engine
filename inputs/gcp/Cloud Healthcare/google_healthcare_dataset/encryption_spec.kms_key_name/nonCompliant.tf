# Healthcare Dataset - encryption_spec (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"

  # VIOLATION: No encryption_spec block — uses Google-managed encryption only (no CMEK)
}
