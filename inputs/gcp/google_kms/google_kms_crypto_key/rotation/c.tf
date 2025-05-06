# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_kms_crypto_key" "c" {
    name            = "compliant-key"
    key_ring        = "example-key-ring"
    purpose         = "ENCRYPT_DECRYPT"  # Compliant: purpose is set as approved
    rotation_period = "2592000s"          # Example rotation period
}

