# Healthcare HL7v2 Store IAM — role attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_hl7_v2_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-hl7v2-store"
}

resource "google_healthcare_hl7_v2_store_iam_member" "c" {
  dataset         = google_healthcare_dataset.c.id
  hl7_v2_store_id = google_healthcare_hl7_v2_store.c.name
  member          = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # COMPLIANT: specific HL7v2 store role — not a primitive role
  role = "roles/healthcare.hl7V2StoreViewer"
}
