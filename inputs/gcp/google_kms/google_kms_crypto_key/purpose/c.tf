# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_kms_crypto_key" "c" {
    name            = "compliant-key"
    key_ring        = "example-key-ring"
    purpose         = "ENCRYPT_DECRYPT"  # Compliant: purpose is set as approved
    rotation_period = "100000s"          # Example rotation period
}

# Compliant signing key: ASYMMETRIC_SIGN + correct label
resource "google_kms_crypto_key" "c_sign" {
  name            = "signing-key"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_SIGN"
  rotation_period = "604800s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}
