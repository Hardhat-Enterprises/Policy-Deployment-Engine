# Healthcare Dataset - encryption_spec (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"

  # COMPLIANT: CMEK encryption configured with a customer-managed KMS key
  encryption_spec {
    kms_key_name = "projects/my-project/locations/us-central1/keyRings/healthcare-kr/cryptoKeys/healthcare-key"
  }
}
