# Healthcare HL7 V2 Store - reject_duplicate_message (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_hl7_v2_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"

  # COMPLIANT: true — duplicate messages rejected, preventing duplicate clinical events
  reject_duplicate_message = true
}
