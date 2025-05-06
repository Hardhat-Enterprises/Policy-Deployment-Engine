# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_hl7_v2_store" "nc" {
    name = "testhl7v2store-nc"
    dataset = "google_healthcare_dataset.nc.id"

    labels = {
    patient_id = "123456" # Sensitive label key
    ssn        = "987-65-4321" # Sensitive label value
  }
}
