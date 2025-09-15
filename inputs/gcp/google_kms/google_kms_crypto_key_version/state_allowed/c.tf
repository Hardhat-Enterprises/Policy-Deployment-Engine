resource "google_kms_crypto_key_version" "c1" {

  crypto_key = "c1"

  state = "ENABLED"


}