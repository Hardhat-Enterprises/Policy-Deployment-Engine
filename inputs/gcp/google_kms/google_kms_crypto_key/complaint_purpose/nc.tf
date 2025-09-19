resource "google_kms_crypto_key" "nc1" {
  name            = "nc1"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_DECRYPT" # Non-compliant: purpose must be "ENCRYPT_DECRYPT"
  rotation_period = "100000s"
}

# NC #2: signing key missing the required label
resource "google_kms_crypto_key" "nc2" {
  name     = "nc2"
  key_ring = "example-key-ring"
  purpose  = "ASYMMETRIC_DECRYPT"
  # no `signing = "true"` label → violation
}