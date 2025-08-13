resource "google_kms_crypto_key" "c1" {
    name            = "compliant-key"
    key_ring        = "example-key-ring"
    purpose         = "ENCRYPT_DECRYPT"  # Compliant: purpose is set as approved
    rotation_period = "100000s"          # Example rotation period
}

# Compliant signing key: ASYMMETRIC_SIGN + correct label
resource "google_kms_crypto_key" "c2" {
  name            = "signing-key"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_SIGN"
  rotation_period = "604800s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}
