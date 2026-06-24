resource "google_kms_crypto_key" "c1_g0" {
  name            = "c1"
  key_ring        = "example-key-ring"
  purpose         = "ENCRYPT_DECRYPT" # Compliant: purpose is set as approved
  rotation_period = "100000s"         # Example rotation period
  labels = {
    signing = "true"
    env     = "prod"
  }
}

resource "google_kms_crypto_key" "c1_g1" {
  name            = "c1"
  key_ring        = "example-key-ring"
  purpose         = "ENCRYPT_DECRYPT" # Compliant: purpose is set as approved
  rotation_period = "2592000s"         # Example rotation period
  labels = {
    signing = "true"
    env     = "prod"
  }
}

resource "google_kms_crypto_key" "c2_g1" {
  name            = "c2"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_SIGN"
  rotation_period = "2592000s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}
