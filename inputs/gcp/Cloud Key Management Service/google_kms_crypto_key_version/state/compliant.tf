resource "google_kms_crypto_key_version" "compliant_example_1" {

  crypto_key = "compliant_example_1"

  state = "ENABLED"

}
