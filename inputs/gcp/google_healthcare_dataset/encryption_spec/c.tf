# Healthcare Dataset — encryption_spec attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"

  # COMPLIANT: CMEK encryption configured with a customer-managed KMS key
  encryption_spec {
    kms_key_name = "projects/my-project/locations/australia-southeast1/keyRings/healthcare-kr/cryptoKeys/healthcare-key"
  }
}
