resource "google_kms_crypto_key_version" "nc1" {

  crypto_key = "nc1"

  state = "DISABLED"
}

