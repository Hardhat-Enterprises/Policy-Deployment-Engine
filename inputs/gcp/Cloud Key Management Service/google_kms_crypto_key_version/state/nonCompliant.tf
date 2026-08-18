resource "google_kms_crypto_key_version" "non_compliant_example_1" {

  crypto_key = "non_compliant_example_1"

  state = "DISABLED"
}

