# Healthcare Dataset - location (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name = "c"

  # COMPLIANT: us-central1 is in the approved locations list
  location = "us-central1"
}
