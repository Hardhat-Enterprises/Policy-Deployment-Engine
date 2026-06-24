resource "google_kms_crypto_key" "non_compliant_example_1" {
  name            = "nc1"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_DECRYPT" # Non-compliant: purpose must be "ENCRYPT_DECRYPT"
  rotation_period = "100000s"
}

# NC #2: signing key missing the required label
resource "google_kms_crypto_key" "non_compliant_example_2" {
  name     = "nc2"
  key_ring = "example-key-ring"
  purpose  = "ASYMMETRIC_DECRYPT"
  # no `signing = "true"` label → violation
}

resource "google_kms_crypto_key" "non_compliant_example_3" {
  name            = "nc1"
  key_ring        = "example-key-ring"
  purpose         = "ENCRYPT_DECRYPT" 
  rotation_period = "100000s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}

resource "google_kms_crypto_key" "non_compliant_example_4" {
  name            = "nc2"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_SIGN"
  rotation_period = "604800s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}
