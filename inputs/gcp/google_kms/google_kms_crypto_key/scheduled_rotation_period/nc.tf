resource "google_kms_crypto_key" "nc1" {
  name            = "nc1"
  key_ring        = "example-key-ring"
  purpose         = "ENCRYPT_DECRYPT" 
  rotation_period = "100000s"
}


resource "google_kms_crypto_key" "nc2" {
  name            = "nc2"
  key_ring        = "example-key-ring"
  purpose         = "ASYMMETRIC_SIGN"
  rotation_period = "604800s"
  labels = {
    signing = "true"
    env     = "prod"
  }
}