# Healthcare Dataset - location (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "non_compliant_example_1" {
  name = "non_compliant_example_1"

  # VIOLATION: us-west1 is not in the approved locations list
  location = "us-west1"
}
