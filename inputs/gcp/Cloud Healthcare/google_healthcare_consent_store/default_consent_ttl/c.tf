# Healthcare Consent Store - default_consent_ttl (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_consent_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"

  # COMPLIANT: TTL explicitly set to 1 year — meets minimum requirement
  default_consent_ttl = "31536000s"
}