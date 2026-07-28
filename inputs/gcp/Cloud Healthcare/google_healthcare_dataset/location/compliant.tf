# Healthcare Dataset - location (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "compliant_example_1" {
  name = "compliant_example_1"

  # COMPLIANT: us-central1 is in the approved locations list
  location = "us-central1"
}
