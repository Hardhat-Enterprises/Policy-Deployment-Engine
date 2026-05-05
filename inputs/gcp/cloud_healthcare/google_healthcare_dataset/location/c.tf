# Healthcare Dataset — location attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name = "compliant-dataset"

  # COMPLIANT: australia-southeast1 is in the approved locations list
  location = "australia-southeast1"
}
