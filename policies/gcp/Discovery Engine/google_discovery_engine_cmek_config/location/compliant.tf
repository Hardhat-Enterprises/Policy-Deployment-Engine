#CMEK CONFIG Location C

resource "google_discovery_engine_cmek_config" "compliant_example_1" {
  location       = "eu"
  cmek_config_id = "compliant_example_1"

  kms_key        = "my-crypto-key"

  project        = "735927692082"
  set_default    = true
}

