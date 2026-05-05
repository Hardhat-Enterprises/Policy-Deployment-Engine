# Healthcare HL7v2 Store IAM — member attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_hl7_v2_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-hl7v2-store"
}

resource "google_healthcare_hl7_v2_store_iam_member" "nc" {
  dataset         = google_healthcare_dataset.nc.id
  hl7_v2_store_id = google_healthcare_hl7_v2_store.nc.name
  role            = "roles/healthcare.hl7V2StoreViewer"

  # VIOLATION: allUsers grants public unauthenticated access to HL7v2 clinical messages
  member = "allUsers"
}
