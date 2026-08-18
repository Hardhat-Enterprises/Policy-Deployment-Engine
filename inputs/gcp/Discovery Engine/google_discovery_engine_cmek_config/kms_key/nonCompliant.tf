#CMEK CONFIG C

resource "google_discovery_engine_cmek_config" "non_compliant_example_1" {
  location       = "eu"
  cmek_config_id = "non_compliant_example_1"

  kms_key        = "nc-crypto-key"

  project        = "735927692082"
  set_default    = true
}

