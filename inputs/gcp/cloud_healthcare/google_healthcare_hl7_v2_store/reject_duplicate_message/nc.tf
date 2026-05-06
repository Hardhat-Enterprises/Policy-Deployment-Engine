# Healthcare HL7 V2 Store - reject_duplicate_message (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_hl7_v2_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc"

  # VIOLATION: false — duplicate messages accepted, may cause duplicate clinical events
  reject_duplicate_message = false
}
