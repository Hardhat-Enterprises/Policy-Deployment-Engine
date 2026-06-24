resource "google_kms_crypto_key" "nc1_g0" {
  name            = "nc1"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_DECRYPT" # Non-compliant: purpose must be "ENCRYPT_DECRYPT"
  rotation_period = "100000s"
}

# NC #2: signing key missing the required label
resource "google_kms_crypto_key" "nc2_g0" {
  name     = "nc2"
  key_ring = "example-key-ring"
  purpose  = "ASYMMETRIC_DECRYPT"
  # no `signing = "true"` label → violation
}

resource "google_kms_crypto_key" "nc1_g1" {
  name            = "nc1"
  key_ring        = "example-key-ring"
  purpose         = "ENCRYPT_DECRYPT" 
  rotation_period = "100000s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}


resource "google_kms_crypto_key" "nc2_g1" {
  name            = "nc2"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_SIGN"
  rotation_period = "604800s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}
