# Healthcare Consent Store - default_consent_ttl (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_consent_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"

  # COMPLIANT: TTL explicitly set to 1 year — meets minimum requirement
  default_consent_ttl = "31536000s"
}
